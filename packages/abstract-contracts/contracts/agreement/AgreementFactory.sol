// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

/// @title Agreement Factory contract
/// @author Kiwari Labs

// import "@kiwarilabs/contracts/argeement/BilateralAgreementTemplate.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AgreementFactory is Ownable {
    constructor() Ownable(msg.sender) {}

    function createNewAgreement() external onlyOwner returns (address) {
        // @TODO
        // Agreement agreement = new Agreement();
        // emit NewAgreementContract(address(agreement), _owner);
        // return address(agreement);
    }
}