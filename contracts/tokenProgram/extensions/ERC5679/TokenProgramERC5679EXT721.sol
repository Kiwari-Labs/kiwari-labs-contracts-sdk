// SPDX-License-Identifier: Apache-2.0

import {AbstractTokenProgram} from "../AbstractTokenProgram.sol";
import {IERC5679EXT721 as IERC5679} from "../../../interfaces/IERC5679/IERC5679EXT721.sol";

abstract contract TokenProgramERC5679EXT721 is AbstractTokenProgram {
    // @TODO
    
    function programTokenType()
        public
        pure
        override
        returns (PROGRAM_TOKEN_TYPE)
    {
        return PROGRAM_TOKEN_TYPE.NON_FUNGIBLE_TOKEN;
    }
}