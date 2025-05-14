// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {AddressComparators} from "../libraries/comparators/AddressComparators.sol";
import {BoolComparators} from "../libraries/comparators/BoolComparators.sol";
import {UIntComparators} from "../libraries/comparators/UIntComparators.sol";

abstract contract AbstractConditionalTrade {
    using AddressComparators for address;
    using BoolComparators for bool;
    using UIntComparators for uint256;

    // ... skipping 

    function tradeValidation(bytes memory payload) public view returns (bool) {
        // implementation OTC contract should call `tradeValidation()` if `true` perform settlement by transfer/transferFrom.
        return _validateTrade(payload);
    }

    function terminationValidation(bytes memory payload) public view returns (bool) {
        return _validateTermination(payload);
    }

    // encode payload with abi.encode
    // e.g. tokenA, partyB, valueA, tokenB, partyA, valueB, ... additional e.g. unixtimestamp/blocknumber start/deadline
    function _validateTrade(bytes memory payload) internal virtual view returns (bool) {
        // decode payload
        (address tokenA, address partyB, uint256 valueA, 
         address tokenB, address partyA, uint256 valueB) =
         abi.decode(payload, (address, address, uint256, address, address, uint256));
        // require condition check
        require(partyA.isNotZeroAddress(), "[INVALID] partyA can't be zero address");
        require(partyB.isNotZeroAddress(), "[INVALID] partyB can't be zero address");
        require(partyA.notEqual(partyB), "[INVALID] invalid counter party address");
        require(IERC20(tokenA).balanceOf(partyB).greaterThanOrEqualTo(valueA), "[INVALID] partyB insufficient balance for trade");
        require(IERC20(tokenB).balanceOf(partyA).greaterThanOrEqualTo(valueB), "[INVALID] partyA insufficient balance for trade");
        // example cases scenarios
        // require(block.number.lessThan(deadline), "[INVALID] trade expired"); 
        // require(block.timestamp.lessThan(deadline), "[INVALID] trade expired");
        // require(Compliance.isSanction(partyA).or(Compliance.isSanction(partyB)),"[INVALID] counter party are in sanction list");

        return true;
    }

    function _validateTermination(bytes memory payload) internal virtual view returns (bool) {

        return true;
    }
}
