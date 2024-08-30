// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "./PointEXP.sol";
import "./interfaces/IPointFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PoolPointFactory is IPointFactory, Ownable {
    constructor() Ownable(msg.sender) {}

    /// @inheritdoc IPointFactory
    function createNewPointContract(
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

        // frameSize is meaning expirePeriod_ uint in slot.
        // slotSize if slot declare to 4 mean each era (year) partitioning into 4 slot.
        // it's abstract term for avoided covertion about unit you can set it to 4 slot.
        // and frameSize 1 slot can be estimated as 3 months
        Point point = new Point(_name, _symbol, _decimals, _blockTime, _frameSize, _slotSize);

        emit NewPointContract(address(point), _owner);

        return address(point);
    }
}
