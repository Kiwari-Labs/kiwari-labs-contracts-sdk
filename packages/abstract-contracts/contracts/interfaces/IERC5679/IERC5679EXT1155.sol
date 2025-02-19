// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Interface of ERC-5679 extending ERC-1155
 * @dev See https://eips.ethereum.org/EIPS/eip-5679
 * @author Zainan Victor Zhou (@xinbenlv)
 */

// The EIP-165 identifier of this interface is `0xf4cedd5a`.
interface IERC5679EXT1155 {
    function safeMint(
        address to,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) external;

    function safeMintBatch(
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) external;

    function burn(
        address from,
        uint256 id,
        uint256 amount,
        bytes[] calldata data
    ) external;

    function burnBatch(
        address from,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) external;
}
