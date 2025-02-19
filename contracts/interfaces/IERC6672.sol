// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Interface of ERC-6672
 * @dev See https://eips.ethereum.org/EIPS/eip-6672
 * @author RE:DREAMER Lab et al <dev@redreamer.io>.
 */

// The EIP-165 identifier of this interface is `0x4dddf83f`.
interface IERC6672 {
    /**
     * @dev This event emits when an NFT is redeemed.
     */
    event Redeem(
        address indexed operator,
        uint256 indexed tokenId,
        address redeemer,
        bytes32 redemptionId,
        string memo
    );

    /**
     * @dev This event emits when a redemption is canceled.
     */
    event Cancel(
        address indexed operator,
        uint256 indexed tokenId,
        bytes32 redemptionId,
        string memo
    );

    /**
     * @notice Check whether an NFT is already used for redemption or not.
     * @dev
     * @param operator The address of the operator of the redemption platform.
     * @param redemptionId The identifier for a redemption.
     * @param tokenId The identifier for an NFT.
     * @return Whether an NFT is already redeemed or not.
     */
    function isRedeemed(
        address operator,
        bytes32 redemptionId,
        uint256 tokenId
    ) external view returns (bool);

    /**
     * @notice List the redemptions created by the given operator for the given NFT.
     * @dev
     * @param operator The address of the operator of the redemption platform.
     * @param tokenId The identifier for an NFT.
     * @return List of redemptions of specific `operator` and `tokenId`.
     */
    function getRedemptionIds(
        address operator,
        uint256 tokenId
    ) external view returns (bytes32[] memory);

    /**
     * @notice Redeem an NFT
     * @dev
     * @param redemptionId The identifier created by the operator for a redemption.
     * @param tokenId The NFT to redeem.
     * @param memo The memo text.
     */
    function redeem(
        bytes32 redemptionId,
        uint256 tokenId,
        string memory memo
    ) external;

    /**
     * @notice Cancel a redemption
     * @dev
     * @param redemptionId The redemption to cancel.
     * @param tokenId The NFT to cancel the redemption.
     * @param memo The memo text.
     */
    function cancel(
        bytes32 redemptionId,
        uint256 tokenId,
        string memory memo
    ) external;
}
