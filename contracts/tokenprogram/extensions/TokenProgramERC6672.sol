// SPDX-License-Identifier: Apache-2.0

import {AbstractTokenProgram} from "../AbstractTokenProgram.sol";
import {IERC6672} from "../../interfaces/IERC6672.sol";

abstract contract TokenProgramERC6672 is AbstractTokenProgram {
    function _redeem(
        bytes32 redemptionId,
        uint256 tokenId,
        string memory memo
    ) internal virtual {
        IERC6672(token()).redeem(redemptionId, tokenId, memo);
    }

    function _cancel(
        bytes32 redemptionId,
        uint256 tokenId,
        string memory memo
    ) internal virtual {
        IERC6672(token()).cancel(redemptionId, tokenId, memo);
    }

    function programTokenType()
        public
        pure
        override
        returns (PROGRAM_TOKEN_TYPE)
    {
        return PROGRAM_TOKEN_TYPE.NON_FUNGIBLE_TOKEN;
    }
}
