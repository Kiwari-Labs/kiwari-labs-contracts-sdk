// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IPoint is IERC20 {
    /// @notice Mint token to target address.

    function mintPoint(address _to, uint256 _amount) external;

    /// @notice Burn token from target address.

    function burnPoint(address _target, uint256 _amount) external;
}
