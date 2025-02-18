// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/**
 * @title Interface for Campaign Factory contract
 * @author Kiwari Labs
 */

import {IERC2470EXT} from "../interfaces/IERC2470EXT.sol";

contract CampaignFactory {
    // error BadRequest(string message);

    // @TODO event

    IERC2470EXT private _proxy;
    uint256 private _counter;
    mapping(uint256 => Campaign) private _campaigns;

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

    function updateDeploymentProxy(IERC2470EXT proxy) external {
        address oldProxy = address(_proxy);
        _proxy = proxy;

        // emit DeploymentProxyUpdated(oldProxy, address(proxy));
    }

    function deployCampaign(Campaign memory campaign, bytes32 salt) public {
        bytes memory code;
        // @TODO encode with constructor

        (address campaignAddress, uint256 CampaignId) = _proxy.deploy(code, salt);
        _counter++;

        // emit CampaignCreated(creator, campaignAddress, campaignId);
    }

    function campaignContractCount() external view returns (uint256) {
        return _counter;
    }

    function listCampaignContracts(
        uint256 start,
        uint8 size
    ) external view returns (address[] memory) {
        // @TODO
    }

    function campaignInfoById(
        uint256 campaignId
    ) external view returns (Campaign memory) {
        return _campaigns[campaignId];
    }
}
