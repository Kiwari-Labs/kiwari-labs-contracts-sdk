// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.5.0 <0.8.0;

/// @author Kiwari Labs

// @TODO move to
// import "@kiwarilabs/contracts/argeement/BilateralAgreementTemplate.sol";

contract AgreementFactory {

    struct Channel {
        address partyA;
        address partyB;
        uint256 createdBlock;
        uint256 periodBlock;
    }

    mapping(address => Channel) private _registry;

    function create() public {
        // check if agreement exist or not.
        // if not create channel
        // address channel = _create();
        // else revert
        // emit 
    }

    function channel() public {
        // return channel detail
    }

    function renew() public {
        // renew channel
        // emit
    }

    function termination() public {
        // both party need to call to termination channel
        // emit
    }

}