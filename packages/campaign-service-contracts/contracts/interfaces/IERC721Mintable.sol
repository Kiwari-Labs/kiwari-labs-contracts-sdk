// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IERC721Mintable {
    function mint(address to, uint256 tokenId) external;
}