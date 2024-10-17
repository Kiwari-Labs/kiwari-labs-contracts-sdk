// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/// @title Point Token Factory contract
/// @author Kiwari Labs

import "./PointToken.sol";
import "./interfaces/IPointFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PointTokenFactory is IPointTokenFactory, Ownable {
    constructor() Ownable(msg.sender) {}

    /// @inheritdoc IPointFactory
    function createNewPointContract(
        uint256 _initialSupply,
        address _owner,
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint16 _blockTime,
        uint8 _frameSize,
        uint8 _slotSize
    ) external onlyOwner returns (address) {
        if (_owner == address(0)) {
            revert BadRequest("Owner address must not be the zero address");
        }

        Point point = new Point(
            _owner,
            _name,
            _symbol,
            _decimals,
            _blockTime,
            _frameSize,
            _slotSize
        );

        emit NewPointContract(address(point), _owner);

        return address(point);
    }
}
