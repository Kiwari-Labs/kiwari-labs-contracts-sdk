// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/**
 * @title Deployment Proxy
 * @author Kiwari Labs
 */

import {AbstractERC2470EXT} from "./AbstractERC2470EXT";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

contract DeploymentProxy is AbstractERC2470EXT, Ownable, Pausable {
    constructor() Ownable(msg.sender) {}

    function deploy(
        bytes memory initCode,
        bytes32 salt
    )
        public
        payable
        override
        returns (address payable createdContract)
    {
        return super.deploy(initCode, salt);
    }
}
