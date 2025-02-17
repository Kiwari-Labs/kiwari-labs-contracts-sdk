// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IERC20Mintable {
    
    /// @param to address
    /// @param valueOrTokenId
    function mint(address to, uint256 valueOrTokenId) external;
}
