// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Interface of ERC-5679 extending ERC-1155
 * @dev See https://eips.ethereum.org/EIPS/eip-5679
 * @author Zainan Victor Zhou (@xinbenlv)
 */

// The ERC-165 identifier of this interface is `0xf4cedd5a`.
interface IERC5679EXT1155 {
    /**
     * @param to address
     * @param id tokenType
     * @param amount amount of token
     * @param data data
     */
    function safeMint(
        address to,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) external;

    /**
     * @param to address
     * @param id array of tokenType
     * @param amounts array of token amount
     * @param data data
     */
    function safeMintBatch(
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) external;

    /**
     * @param from address
     * @param id tokenType
     * @param amount amount of token
     * @param data data
     */
    function burn(
        address from,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) external;

    /**
     * @param from address
     * @param ids array of tokenType
     * @param amounts array of token amount
     * @param data data
     */
    function burnBatch(
        address from,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) external;
}
