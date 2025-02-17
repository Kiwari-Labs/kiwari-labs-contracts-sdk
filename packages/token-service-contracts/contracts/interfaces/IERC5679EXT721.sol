// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/**
 * @title Interface of ERC-5679 extending ERC-721
 * @author Zainan Victor Zhou (@xinbenlv)
 */

interface IERC5679EXT721 {
    /**
     * @param to address
     * @param tokenId tokenId
     * @param data data
     */
    function safeMint(address to, uint256 tokenId, bytes calldata data) external;

    /**
     * @param from address
     * @param tokenId tokenId
     * @param data data
     */
    function burn(address from, uint256 tokenId, bytes calldata data) external;
}
