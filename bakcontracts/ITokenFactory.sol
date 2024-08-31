// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.5.0 <0.8.0;

interface IFactory {

    enum TOKEN_PROFILE { NON_EXPIRABLE, EXPIRABLE }
    enum TOKEN_TYPE { FUNGIBLE, NON_FUNGIBLE, SEMI_FUNGIBLE }

    struct TokenInfo {
        address owner;
        TOKEN_PROFILE profile;
        TOKEN_TYPE tokenType;
        bool status;
        TokenMetaData metadata;
    }
    
    struct TokenMetaData {
        string name;
        string symbol;
    }

    event tokenCreated(address token, address indexed owner);
    event tokenStatusUpdated(address indexed token, bool indexed status);
    event tokenIssuerUpdated(address indexed token, address indexed owner);

    function createdToken(TokenInfo memory token) external returns (address);
    function updateTokenStatus(address token, bool status) external returns (bool);
    function updateTokenOwner(address token, address owner) external returns (bool);
    function tokenInfo(address token) external view returns (TokenInfo);
    function fetchTokenOfOwner(address owner, uint256 startIndex, uint256 pageSize) external view returns (TokenInfo []);


    // Factory -> proxy selector -  createV1 (ERC20)
    //         |        -  createV2
    //         |        -> createV3
    //         -> proxy -> createV1 (ERC721)
    //         -> proxy -> createV1 (ERC1155)
    // if the Factory passing encoded of token meta data in bytes memory instead of each field idea?
    // allowing createV1 and V2 to have same interface.
}