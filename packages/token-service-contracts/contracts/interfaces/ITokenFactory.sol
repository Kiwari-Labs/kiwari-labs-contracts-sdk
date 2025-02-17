// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/**
 * @title Interface of Token Factory 
 * @author Kiwari Labs
 */

interface ITokenFactory {
    event TokenCreated(address indexed creator, address createdContract);

    // @TODO adding parameters to this function.
    function deploy() external;

    function contractCount() external view returns (uint256);

    function listContracts(uint256 start, uint256 size) external view returns (uint256);
}