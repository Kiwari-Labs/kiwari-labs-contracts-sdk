// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/**
 * @title Agreement Template
 * @author Kiwari Labs
 * @notice this contract is abstract contract do not modify this contract.
 */

import "../interfaces/IAgreement.sol";

abstract contract AbstractAgreement is IAgreement {
    uint32 private _version = 100;
    string private _name;

    /** @dev See {TemplateAgreement.pdf} */
    string private _uri;

    /// @notice Events
    event AgreementComplete();

    /// @notice Custom error definitions
    error AgreementFailed(bytes x, bytes y);

    constructor(string memory name_) {
        _name = name_;
    }

    /// @notice Returns the current version of the agreement
    /// @return The version number of the agreement
    function version() public view returns (uint256) {
        return _version;
    }

    /// @notice Returns the name of the agreement
    /// @return The name of the agreement
    function name() public view returns (string memory) {
        return _name;
    }

    function agreementURI() public view returns (string memory) {
        return _uri;
    }

    /// @inheritdoc IAgreement
    function agreement(bytes memory x, bytes memory y) public override returns (bool) {
        if (!_verifyAgreement(x, y)) {
            revert AgreementFailed(x, y);
        }
        emit AgreementComplete();
        return true;
    }

    /// @dev Internal function to verify the agreement between party A and party B
    /// @param x The input parameters provided by party A
    /// @param y The input parameters provided by party B
    /// @return True if the agreement is valid, otherwise false
    function _verifyAgreement(bytes memory x, bytes memory y) internal virtual returns (bool) {}
}
