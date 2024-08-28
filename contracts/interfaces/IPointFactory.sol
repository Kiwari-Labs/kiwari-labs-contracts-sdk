// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

interface IPointFactory {
    /// @notice Emitted when `deploy` is called
    event NewPointContract(address indexed pointAddress, address indexed owner);

    error BadRequest(string message);

    /**
     * @notice This function used for deploy PoolPointInitializable Contract
     * The _owner must not equal to zero address and value of _initialSupply must more than 0
     * @param _initialSupply The number of initial supply tokens for transfer to PoolPointInitializable Contract
     * @param _owner The address of ower who can do enything in the contract
     * @param _name The name of token for used in the contract.
     * @param _symbol The symbol of token for used in the contract.
     */

    function createNewPointContract(
        uint256 _initialSupply,
        address _owner,
        string memory _name,
        string memory _symbol
    ) external returns (address);
}
