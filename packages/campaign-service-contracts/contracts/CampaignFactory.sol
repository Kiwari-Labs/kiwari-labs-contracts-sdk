// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

/// @title Campaign Factory contract
/// @author Kiwari Labs

import "./Campaign.sol";
import "./interfaces/IERC20Mintable.sol";
import "./interfaces/ICampaignFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CampaignFactory is ICampaignFactory, Ownable {
    mapping(address => bool) private whitelistedAddresses;

    constructor() Ownable(msg.sender) {}

    modifier onlyOwnerOrWhitelisted() {
        require(
            whitelistedAddresses[msg.sender] || owner() == msg.sender,
            "Permission deny"
        );
        _;
    }

    function createNewCampaignContract(
        address _owner,
        uint256 _startBlock,
        uint256 _validFor,
        address _rewardToken,
        uint256 _rewardAmount,
        uint256 _rewardLimit
    ) external onlyOwnerOrWhitelisted returns (address) {
        Campaign campaign = new Campaign(
            _owner,
            _startBlock,
            _validFor,
            _rewardToken,
            _rewardAmount,
            _rewardLimit
        );
        if (_owner == address(0)) {
            revert BadRequest("Owner address must not be the zero address");
        }

        emit NewCampaignContract(address(campaign), _owner);

        return address(campaign);
    }

    // Function to add an address to the whitelist, restricted to onlyOwner
    function addAddressToWhitelist(address _address) external onlyOwner {
        whitelistedAddresses[_address] = true;
    }

    // Function to remove an address from the whitelist, restricted to onlyOwner
    function removeAddressFromWhitelist(address _address) external onlyOwner {
        whitelistedAddresses[_address] = false;
    }

    // Function to check if an address is whitelisted
    function isWhitelisted(address _address) external view returns (bool) {
        return whitelistedAddresses[_address];
    }
}
