// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/**
 * @title Interface for Campaign Factory contract
 * @author Kiwari Labs
 */

import {IERC2479EXT} from "../interfaces/IERC2479EXT.sol";

interface ICampaignFactory is IERC2479EXT {

    error BadRequest(string message);

    enum TOKEN_TYPE {
        FUNGIBLE_TOKEN,
        NON_FUNGIBLE_TOKEN
    }

    enum CAMPAIGN_TYPE {
        EARN,
        BURN
    }

    struct Campaign {
        uint256 start;
        uint256 end;
        TOKEN_TYPE tokenType;
        CAMPAIGN_TYPE campaignType;
        address owner;
        string uri;
    }

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
        uint256 _rewardAmount
    ) external returns (address);

    function campaignContractCount() external view returns (uint256);

    function listCampaignContracts(
        uint256 start,
        uint8 size
    ) external view returns (address[] memory);

    function getCampaignInfoById(
        uint256 id
    ) external view returns (Campaign memory);

    function getCampaignInfoByAddress(
        address campaign
    ) external view returns (Campaign memory);
}
