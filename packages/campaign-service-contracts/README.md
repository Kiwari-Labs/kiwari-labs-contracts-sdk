---
title: "Reward Contract"
description: "reward distribution for fungible and non-fungible tokens"
---

## Abstract

> TODO

## Motivation

> TODO

## Specification

``` Solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Reward Contract
 * @notice Implements reward distribution for fungible and non-fungible tokens.
 * Supports block-based campaigns and eligibility checks.
 */
interface IRewardContract {
    /// @notice Enum to differentiate reward token types.
    enum TOKEN_TYPE { FUNGIBLE, NON_FUNGIBLE }

    /// @notice Event emitted when a reward is earned by a recipient.
    event RewardEarned(
        address indexed asset,
        address indexed recipient,
        uint256 value
    );

    /// @dev Returns the type of reward token: 0 for FT, 1 for NFT.
    function rewardTokenType() external view returns (TOKEN_TYPE);

    /// @dev Returns the total supply of reward tokens allocated for the campaign.
    function totalRewardAllocation() external view returns (uint256);

    /// @dev Returns the total reward tokens distributed to recipients so far.
    function totalRewarded() external view returns (uint256);

    /// @dev Returns the address of the reward token (ERC-20 or ERC-721 contract).
    function rewardToken() external view returns (address);

    /// @dev Returns the campaign's start and end block number.
    function startBlockNumber() external view returns (uint256);
    function endTBlockNumber() external view returns (uint256);

    /// @dev Returns whether the campaign is currently active.
    function isActivated() external view returns (bool);

    /**
     * @notice Checks whether a given account is eligible for a reward.
     * @dev Implementations may include checks like campaign status and user qualification.
     * @param account The address to check eligibility for.
     * @return True if the account is eligible, false otherwise.
     */
    function isEligible(address account) external view returns (bool);

    /**
     * @notice Allows a user to claim their pre-determined reward.
     * @dev The claimable amount must be pre-calculated or fixed.
     * @return true if the claim is successful.
     */
    function claimReward() external returns (bool);
}
```

### Function behavior

> TODO

## Rationale

> TODO

## Backwards Compatibility

> TODO

## Security Consideration
