// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

/// @title Campaign Factory contract
/// @author Kiwari Labs

import "./Campaign.sol";
import "./interfaces/IERC20Mintable.sol";
import "./interfaces/ICampaignFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CampaignFactory is ICampaignFactory, Ownable {
    constructor() Ownable(msg.sender) {}

    function createNewCampaignContract(
        address _owner,
        uint256 _startBlock,
        uint256 _validFor,
        address _rewardToken,
        uint256 _rewardAmount
    )
        external
        onlyOwner
        returns (address)
    {
        Campaign campaign = new Campaign(
            _owner,
            _startBlock,
            _validFor,
            _rewardToken,
            _rewardAmount
        );
        if (_owner == address(0)) {
            revert BadRequest("Owner address must not be the zero address");
        }

        emit NewCampaignContract(address(campaign), _owner);

        return address(campaign);
    }


}
