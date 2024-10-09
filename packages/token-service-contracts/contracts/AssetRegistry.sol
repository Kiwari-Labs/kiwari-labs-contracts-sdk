// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

contract AssetRegistry {
    enum ASSET_TYPE {
        ERC20,
        ERC721,
        ERC1155
    }
    // enum EXPIARABLE { }

    struct Asset {
        ASSET_TYPE assetType;
        address owner;
        bool status;
    }

    event AssetAdded(ASSET_TYPE indexed assetTypes, address assetAddress);
    event AssetRemoved(address assetAddress);
    event AssetInfoUpdate(address indexed assetAddress);

    mapping(address => Asset) private _assetRegistry;

    function add() public {}

    function remove() public {}
}
