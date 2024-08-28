// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "./Point.sol";
import "./interfaces/IPointFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PoolPointFactory is IPointFactory, Ownable {
    constructor() Ownable(msg.sender) {}

    /// @inheritdoc IPointFactory
    function createNewPointContract(
        uint256 _initialSupply,
        address _owner,
        string memory _name,
        string memory _symbol
    ) external onlyOwner returns (address) {
        if (_initialSupply <= 0) {
            revert BadRequest("Initial supply must be greater than 0");
        }

        if (_owner == address(0)) {
            revert BadRequest("Owner address must not be the zero address");
        }

        Point point = new Point(_initialSupply, _owner, _name, _symbol);

        emit NewPointContract(address(point), _owner);

        return address(point);
    }
}
