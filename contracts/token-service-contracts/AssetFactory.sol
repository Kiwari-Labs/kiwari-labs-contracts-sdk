// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

// import "@kiwarilabs/contracts/preset/ERC20EXP.sol.sol";
// import "@kiwarilabs/contracts/preset/ERC721EXP.sol.sol";
// import "@kiwarilabs/contracts/preset/ERC1155EXP.sol.sol";

import "./interfaces/IAssetFactory.sol";
import "@openzeppelin/contracts/access/extensions/AccessControlEnumerable.sol";

contract AssetFactory is IAssetFactory, AccessControlEnumerable {
    bytes32 private constant CREATOR_ROLE = keccak256("CREATOR_ROLE");
    bytes32 private constant OPERATOR_ROLE =
        keccak256("SECURITY_OPERATION_ROLE");

    constructor() Ownable(msg.sender) {
        // initialized role if needed.
    }

    // passing asset type then create a contract from configuration.
    function createAsset(
        uint256 _initialSupply,
        address _owner,
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint16 _blockTime,
        uint8 _frameSize,
        uint8 _slotSize
    ) external onlyOwner returns (address) {
        if (_owner == address(0)) {
            revert BadRequest("Owner address must not be the zero address");
        }

        // if type is ERC20
        // createERC20EXP()

        // if type is ERC721
        // createERC721EXP()

        // if type is ERC1155
        // createERC1155()

        Point point = new Point(
            _owner,
            _name,
            _symbol,
            _decimals,
            _blockTime,
            _frameSize,
            _slotSize
        );

        emit NewPointContract(address(point), _owner);

        return address(point);
    }
}
