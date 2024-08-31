// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.5.0 <0.8.0;

interface ITokenRegistry {

    event tokenAddedToRegistry(address token);
    event tokenRemovedFromRegistry(address token);

    function totalTokenInRegistry() external view returns (uint256);
    function fetchTokenFromRegistry(uint256 startIndex, uint256 pageSize) external view returns (address []);
    function tokenExist(address token) external view returns (bool);
    function addTokenToRegistry(address token) external returns (bool);
    function removeTokenFromRegistry(address token) external returns (bool);
}