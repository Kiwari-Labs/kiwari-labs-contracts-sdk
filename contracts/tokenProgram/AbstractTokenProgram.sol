// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

abstract contract AbstractTokenProgram {
    enum PROGRAM_POINTER_TYPE {
        BLOCKS_BASED,
        TIME_BASED
    }

    enum PROGRAM_TYPE {
        BURN,   // burn asset get something back.
        MINT    // mint asset after complete something.
    }

    enum PROGRAM_TOKEN_TYPE {
        UNKNOWN,            // Unknown
        FUNGIBLE_TOKEN,     // ERC-20
        NON_FUNGIBLE_TOKEN, // ERC-721
        SEMI_FUNGIBLE_TOKEN // ERC-1155
    }

    uint256 private _start;
    uint256 private _end;
    address private _token;
    string private _uri;

    error TokenProgramInvalidStartPoint();

    constructor(
        uint256 start_,
        uint256 end_,
        address token_,
        string memory uri_
    ) {
        if (start_ > _pointerProvider() || start_ < end_) {
            revert TokenProgramInvalidStartPoint();
        }
        _start = start_;
        _end = end_;
        _token = token_;
        _uri = uri_;
    }

    /**
     * @notice Default use block.number.
     * @return uint256 pointer
     */
    function _pointerProvider() internal virtual view returns (uint256) {
        return block.number;
    }

    /**
     *
     */
    function _setPeriod(uint256 start, uint256 end) internal {
        if (start > _pointerProvider() || start < end) {
            revert TokenProgramInvalidStartPoint();
        }
        start = start;
        _end = end;
    }

    /**
     * @param uri The uri of the token program.
     */
    function _setURI(string memory uri) internal {
        _uri = uri;
    }

    /**
     * @param tokenAddress The token address of the token that use in token program.
     */
    function _setToken(address tokenAddress) internal {
        _token = tokenAddress;
    }

    /**
     * @return address The token address.
     */
    function token() public view returns (address) {
        return _token;
    }

    /**
     * @return bool The status of the token program.
     */
    function programStatus() public view returns (bool) {
        uint256 pointerProvider = _pointerProvider();
        return (pointerProvider >= _start && pointerProvider <= _end);
    }

    /**
     * @return uint256 The start of the token program.
     * @return uint256 The end of the token program.
     */
    function programPeriod() public view returns (uint256, uint256) {
        return (_start, _end);
    }

    /**
     * @notice Default use BLOCKS_BASED type.
     * @return PROGRAM_POINTER_TYPE The type of pointer.
     */
    function programPointerType() public virtual pure returns (PROGRAM_POINTER_TYPE) {
        return PROGRAM_POINTER_TYPE.BLOCKS_BASED;
    }

    /**
     * @notice Default use BURN type.
     * @return PROGRAM_TYPE The type of token program.
     */
    function programType() public virtual pure returns (PROGRAM_TYPE) {
        return PROGRAM_TYPE.BURN;
    }

    /**
     * @notice Default use FUNGIBLE_TOKEN type.
     * @return PROGRAM_TYPE The type of token that use in token program.
     */
    function programTokenType() public virtual view returns (PROGRAM_TOKEN_TYPE) {
        return PROGRAM_TOKEN_TYPE.FUNGIBLE_TOKEN;
    }

    /**
     * @return String The URI of token program.
     */
    function programURI() public view returns (string memory) {
        return _uri;
    }
}