// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Interface of ERC-2135
 * @author Zainan Victor Zhou (@xinbenlv)
 */

// The ERC-165 identifier of this interface is `0xdd691946`
interface IERC2135 {
    /**
     * @notice The consume function consumes a token every time it succeeds.
     * @param consumer the address of consumer of this token. It doesn't have
     *                  to be the EOA or contract Account that initiates the TX.
     * @param assetId  the NFT asset being consumed
     * @param data     extra data passed in for consume for extra message
     *                  or future extension.
     */
    function consume(
        address consumer,
        uint256 assetId,
        uint256 amount,
        bytes calldata data
    ) external returns (bool success);

    /**
     * @notice The interface to check whether an asset is consumable.
     * @param consumer the address of consumer of this token. It doesn't have
     *                  to be the EOA or contract Account that initiates the TX.
     * @param assetId  the NFT asset being consumed.
     * @param amount   the amount of the asset being consumed.
     */
    function isConsumableBy(
        address consumer,
        uint256 assetId,
        uint256 amount
    ) external view returns (bool consumable);

    /**
     * @notice The event emitted when there is a successful consumption.
     * @param consumer the address of consumer of this token. It doesn't have
     *                  to be the EOA or contract Account that initiates the TX.
     * @param assetId  the NFT asset being consumed
     * @param amount   the amount of the asset being consumed.
     * @param data     extra data passed in for consume for extra message
     *                  or future extension.
     */
    event OnConsumption(
        address indexed consumer,
        uint256 indexed assetId,
        uint256 amount,
        bytes data
    );
}
