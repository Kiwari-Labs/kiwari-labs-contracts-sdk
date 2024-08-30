// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./interfaces/IPoint.sol";

/**
 * @title The Point Implementation
 *
 * @notice This contract implement for layalty program.
 */
contract Point is ERC20Permit, ERC20Burnable, Ownable, IPoint {
    uint8 private _decimals;

    constructor(
        uint256 _initialSupply,
        address _owner,
        string memory _name,
        string memory _symbol,
        uint8 decimals_
    ) ERC20(_name, _symbol) ERC20Permit(_name) Ownable(_owner) {
        mintPoint(msg.sender, _initialSupply);
        _decimals = _decimals;
    }

    function decimals() public view override returns (uint8) {
        return _decimals;
    }

    /// @inheritdoc IPoint
    function mintPoint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    /// @inheritdoc IPoint
    function burnPoint(address _target, uint256 _amount) external {
        _burn(_target, _amount);
    }
}
