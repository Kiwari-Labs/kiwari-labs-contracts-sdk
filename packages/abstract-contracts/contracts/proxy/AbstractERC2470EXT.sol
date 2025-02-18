// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

import {IERC2470EXT} from "../interfaces/IERC2470EXT.sol";
import {Create2} from "@openzeppelin/contracts/utils/Create2.sol";

abstract contract AbstractERC2470EXT is IERC2470EXT {
    uint256 private _counter;

    function deploy(
        bytes memory initCode,
        bytes32 salt
    )
        public
        payable
        virtual
        returns (address payable createdContract)
    {
        address creator = msg.sender;
        createdContract = Create2.deploy(msg.value, salt, initCode);
        _counter++;
        emit ContractCreated(creator, createdContract);

        return (createdContract);
    }

    function contractCount() public view returns (uint256) {
        return _counter;
    }
}
