// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

/// @title Interface for Point Token Factory contract
/// @author Kiwari Labs

interface IPointTokenFactory {
    /// @notice Emitted when `deploy` is called
    event NewPointContract(address indexed pointAddress, address indexed owner);

    error BadRequest(string message);

    /**
     * @notice This function used for deploy PoolPointInitializable Contract
     * The _owner must not equal to zero address and value of _initialSupply must more than 0
     * frameSize is meaning expirePeriod_ uint in slot.
     * slotSize if slot declare to 4 mean each era (year) partitioning into 4 slot.
     * it's abstract term for avoided covertion about unit you can set it to 4 slot.
     * and frameSize 1 slot can be estimated as 3 months
     * @param _initialSupply The number of initial supply tokens for transfer to PoolPointInitializable Contract
     * @param _owner The address of ower who can do enything in the contract
     * @param _name The name of token for used in the contract.
     * @param _symbol The symbol of token for used in the contract.
     * @param _decimals The decimals place of token for used in the contract.
     * @param _blockTime The blocktime of the network.
     * @param _frameSize The expire period of token for used in the contract.
     * @param _slotSize The abstract partition in sliding window for used in contract.
     */

    function createNewPointContract(
        uint256 _initialSupply,
        address _owner,
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint16 _blockTime,
        uint8 _frameSize,
        uint8 _slotSize
    ) external returns (address);
    
}
