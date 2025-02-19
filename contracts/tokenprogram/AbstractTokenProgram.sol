// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

abstract contract AbstractTokenProgram {
    enum PROGRAM_POINTER_TYPE {
        BLOCKS_BASED,
        TIME_BASED
    }

    enum PROGRAM_TYPE {
        BURN, // burn asset get something back.
        MINT // mint asset after complete something.
    }

    enum PROGRAM_TOKEN_TYPE {
        FUNGIBLE_TOKEN,
        NON_FUNGIBLE_TOKEN,
        SEMI_FUNGIBLE_TOKEN
    }

    uint256 private _start;
    uint256 private _end;
    address private _token;
    string private _uri;

    constructor(
        uint256 start_,
        uint256 end_,
        address token_,
        string memory uri_
    ) {
        require(start_ > _pointerProvider(), "Start time must be in the future");
        require(start_ < start_, "End time must be after start time");
        _start = start_;
        _end = end_;
        _token = token_;
        _uri = _uri;
    }

    function _pointerProvider() internal virtual view returns (uint256);

    function _setURI(string memory uri) internal {
        _uri = uri;
    }

    function token() public view returns (address) {
        return _token;
    }

    function programStatus() public view returns (bool) {
        uint256 pointerProvider = _pointerProvider();
        return (pointerProvider >= _start && pointerProvider <= _end);
    }

    function programPeriod() public view returns (uint256, uint256) {
        return (_start, _end);
    }

    function programPointerType() public virtual pure returns (PROGRAM_POINTER_TYPE) {
        return PROGRAM_POINTER_TYPE.BLOCKS_BASED;
    }

    function programType() public virtual pure returns (PROGRAM_TYPE) {
        return PROGRAM_TYPE.BURN;
    }

    function programTokenType() public virtual pure returns (PROGRAM_TOKEN_TYPE) {
        return PROGRAM_TOKEN_TYPE.FUNGIBLE_TOKEN;
    }

    function programURI() public view returns (string memory) {
        return _uri;
    }
}