// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

import {IERC2470EXT} from "../interfaces/IERC2470EXT.sol";

abstract contract AbstractERC2470EXT is IERC2470EXT {

    mapping(uint256 => address) _contracts;
    uint256 private _counter;

    function deploy(bytes memory initCode, bytes32 salt) public virtual returns (address payable createdContract, uint256 contractId) {
        address creator = msg.sender;

        // @TODO CREATE2()
        
        emit ContractCreated(creator, createdContract);
    }

    function tokenContractCount() public view returns (uint256) {
        return _counter;
    }

    /**
     * @param size max size per query is 255
     */
    function listTokenContracts(uint256 start, uint8 size) public view returns (address [] memory) {
        address [] memory list = new address[](size);
        address tokenContract;
        // @TODO for loop

        return list;
    }
}