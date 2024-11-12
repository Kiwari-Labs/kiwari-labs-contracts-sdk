// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

/// @title Interface for Campaign Factory contract
/// @author Kiwari Labs

interface ICampaignFactory {
    /// @notice Emitted when `deploy` is called
    event NewCampaignContract(
        address indexed pointAddress,
        address indexed owner
    );

    error BadRequest(string message);

    /**
     * @param _owner The address of ower who can do enything in the contract
     * @param _startBlock The name of token for used in the contract.
     * @param _validFor The symbol of token for used in the contract.
     * @param _rewardToken The decimals place of token for used in the contract.
     * @param _rewardAmount The blocktime of the network.
     */
    function createNewCampaignContract(
        address _owner,
        uint256 _startBlock,
        uint256 _validFor,
        address _rewardToken,
        uint256 _rewardAmount,
        uint256 _rewardLimit
    ) external returns (address);
}
