// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

import {ITokenFactory} from "./interfaces/ITokenFactory.sol";

contract ERC7818Factory is ITokenFactory {

    mapping(uint256 => address) _contracts;
    uint256 private _counter;

    function deploy() public {
        // @TODO
    }

    function contractCount() public view returns (uint256) {
        return _counter;
    }

    /**
     * @param size max size per query is 255
     */
    function listContracts(uint256 start, uint8 size) public view returns (address [] memory) {
        address [] memory list = new address[](size);
        address tokenContract;
        // @TODO for loop

        return list;
    }

}