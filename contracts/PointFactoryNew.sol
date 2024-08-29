// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "./Point.sol";
import "./interfaces/IPointFactory.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PoolPointFactory is IPointFactory, Ownable {

    // null default for not existing asset.
    // preset use the pre-configuration asset profile.
    // custom uset the disirable configuration from creator.
    enum ASSET_PROFILE = { PRESET, CUSTOME }
    // expirable asset for asset that can be expire.
    // non-expirable asset for asset that can't be expire.
    enum ASSET_TYPE = { NON_EXPIRABLE, EXPIRABLE }

    struct AssetInfo {
        ASSET_PROFILE assetProfile;
        ASSET_TYPE assetType;
        bool assetStatus;
        address assetIssuer;
    }

    mapping(address => AssetInfo) private _assetRegistry;

    /** event */
    event assetCreated(ASSET_TYPE indexed assetType, ASSET_PROFILE assetProfile, address assetId, address indexed assetIssuer);
    event assetStatusUpdated(address indexed assetId, bool indexed assetStatus);

    /** error */

    /** constructor */
    constructor() Ownable(msg.sender) {
        // ...
    }

    /// @param assetId address of the asset contract.
    function assetExist(address assetId) public view returns (bool) {
        return _assetRegistry[assetId].assetProfile != address(0);
    }

    /// @param assetId address of the asset contract.
    function assetInfo(address assetId) external view returns (AssetInfo memory) {
        return _assetRegistry[assetId];
    }

    /// @param assetId address of the asset contract.
    /// @param assetStatus true if active otherwise false.
    function updateAssetStatus(address asssetId, bool assetStatus) external {
        AssetInfo memory asset = _assetRegistry[assetId];
        if (asset.assetIssuer != address(0)) {
            revert BadRequest("");
        }
        if (asset.assetStatus != assetStatus) {
            revert BadRequest("");
        }

        _assetRegistry[assetId].assetStatus = assetStatus;

        emit assetStatusUpdated(assetId, assetStatus);
    }

    /// @param assetId address of the asset contract.
    /// @param assetIssuer issuer address of the asset.
    function updateAssetIssuer(address assetId, address assetIssuer) external {
        AssetInfo memory asset = _assetRegistry[assetId];
        if (asset.assetIssuer != msg.sender) {
            revert BadRequest("");
        }
        if (asset.assetIssuer != assetIssuer && assetIssuer != address(0)) {
            revert BadRequest("");
        }

        _assetRegistry[assetId].assetIssuer = assetIssuer;
    
        emit assetIssuerUpdated(assetId, asset.assetIssuer, assetIssuer);
    }

    function createAsset() external {
        if (asset.assetType == ASSET_TYPE.EXPIRABLE) {
            if (asset.assetProfile == ASSET_PROFILE.CUSTOM) {
                if (asset.assetClass == ASSET_CLASS.ERC721) {
                    // new ERC721EXP()
                } else if (asset.assetClass == ASSET_CLASS.ERC1155) {
                    // new ERC1155EXP()
                } else {
                    // new ERC20EXP()
                }
            } else {
                if (asset.assetClass == ASSET_CLASS.ERC721) {
                    // new ERC721EXP()
                } else if (asset.assetClass == ASSET_CLASS.ERC1155) {
                    // new ERC1155EXP()
                } else {
                    // new ERC20EXP()
                }
            }
        } else {
            if (asset.assetClass == ASSET_CLASS.ERC721) {
                // new ERC721()
            } else if (asset.assetClass == ASSET_CLASS.ERC1155) {
                // new ERC1155()
            } else {
                // new ERC20()
            }
        }

        emit assetCreated();
    }
    
    /// @inheritdoc IPointFactory
    function createNewPointContract(
        uint256 _initialSupply,
        address _owner,
        string memory _name,
        string memory _symbol
    ) external onlyOwner returns (address) {
        if (_initialSupply <= 0) {
            revert BadRequest("Initial supply must be greater than 0");
        }

        if (_owner == address(0)) {
            revert BadRequest("Owner address must not be the zero address");
        }

        Point point = new Point(_initialSupply, _owner, _name, _symbol);

        emit NewPointContract(address(point), _owner);

        return address(point);
    }
}
