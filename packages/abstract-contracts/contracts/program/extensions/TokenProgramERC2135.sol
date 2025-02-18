// SPDX-License-Identifier: Apache-2.0

import {AbstractTokenProgram} from "../AbstractTokenProgram.sol";
import {IERC2135} from "../../interfaces/IERC2135.sol";

abstract contract TokenProgramERC6672 is AbstractTokenProgram {
    function _consume(
        address consumer,
        uint256 assetId,
        uint256 amount,
        bytes calldata data
    ) internal virtual {
        IERC2135(token()).consume(consumer, assetId, amount, data);
    }

    function programTokenType()
        public
        view
        override
        returns (PROGRAM_TOKEN_TYPE)
    {
        // if support ERC721 interface return PROGRAM_TOKEN_TYPE.NON_FUNGIBLE_TOKEN
        // if support ERC1155 interface return PROGRAM_TOKEN_TYPE.SEMI_FUNGIBLE_TOKEN
        return PROGRAM_TOKEN_TYPE.NON_FUNGIBLE_TOKEN;
    }
}
