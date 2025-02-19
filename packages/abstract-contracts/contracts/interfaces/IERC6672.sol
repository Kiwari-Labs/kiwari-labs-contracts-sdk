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
        address indexed _operator,
        uint256 indexed _tokenId,
        address redeemer,
        bytes32 _redemptionId,
        string _memo
    );

    /**
     * @dev This event emits when a redemption is canceled.
     */
    event Cancel(
        address indexed _operator,
        uint256 indexed _tokenId,
        bytes32 _redemptionId,
        string _memo
    );

    /**
     * @notice Check whether an NFT is already used for redemption or not.
     * @dev
     * @param _operator The address of the operator of the redemption platform.
     * @param _redemptionId The identifier for a redemption.
     * @param _tokenId The identifier for an NFT.
     * @return Whether an NFT is already redeemed or not.
     */
    function isRedeemed(
        address _operator,
        bytes32 _redemptionId,
        uint256 _tokenId
    ) external view returns (bool);

    /**
     * @notice List the redemptions created by the given operator for the given NFT.
     * @dev
     * @param _operator The address of the operator of the redemption platform.
     * @param _tokenId The identifier for an NFT.
     * @return List of redemptions of speficic `_operator` and `_tokenId`.
     */
    function getRedemptionIds(
        address _operator,
        uint256 _tokenId
    ) external view returns (bytes32[] memory);

    /**
     * @notice Redeem an NFT
     * @dev
     * @param _redemptionId The identifier created by the operator for a redemption.
     * @param _tokenId The NFT to redeem.
     * @param _memo The memo text.
     */
    function redeem(
        bytes32 _redemptionId,
        uint256 _tokenId,
        string memory _memo
    ) external;

    /**
     * @notice Cancel a redemption
     * @dev
     * @param _redemptionId The redemption to cancel.
     * @param _tokenId The NFT to cancel the redemption.
     * @param _memo The memo text.
     */
    function cancel(
        bytes32 _redemptionId,
        uint256 _tokenId,
        string memory _memo
    ) external;
}
