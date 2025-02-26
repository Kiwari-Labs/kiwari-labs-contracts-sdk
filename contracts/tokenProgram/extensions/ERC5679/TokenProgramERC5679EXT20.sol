// SPDX-License-Identifier: Apache-2.0

import {AbstractTokenProgram} from "../AbstractTokenProgram.sol";
import {IERC5679EXT20 as IERC5679} from "../../../interfaces/IERC5679/IERC5679EXT20.sol";

abstract contract TokenProgramERC5679EXT20 is AbstractTokenProgram {
    function _mint(
        address to,
        uint256 amount,
        bytes calldata data
    ) internal virtual {
        IERC5679(token()).mint(to, amount, data);
    }

    function _burn(
        address from,
        uint256 amount,
        bytes calldata data
    ) internal virtual {
        IERC5679(token()).burn(from, amount, data);
    }

    function programTokenType()
        public
        pure
        override
        returns (PROGRAM_TOKEN_TYPE)
    {
        return PROGRAM_TOKEN_TYPE.FUNGIBLE_TOKEN;
    }
}
