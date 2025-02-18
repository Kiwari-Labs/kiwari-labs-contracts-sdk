// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/**
 * @title Interface of ERC-2470 with extended function
 * @author Ricardo Guilherme Schmidt (@3esmit), Kiwari Labs
 */

interface IERC2470EXT {
    event ContractCreated(address indexed creator, address createdContract);

    struct Contract {
        // @TODO TBD
        address creator;
        string uri; // store meta-data off-chain
    }

    /**
     * @return createdContract The address of the smart contract
     * @return contractId The identifier of the smart contract
     */
    function deploy(bytes memory initCode, bytes32 salt) external returns (address payable createdContract, uint256 contractId);

    function contractCount() external view returns (uint256);

    function listContracts(uint256 start, uint256 size) external view returns (uint256);

    function getContractInfoById() external view returns (Contract memory);

    function getContractInfoByAddress() external view returns (Contract memory);
}