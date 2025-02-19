// SPDX-License-Identifier: Apache-2.0

import {AbstractTokenProgram} from "../AbstractTokenProgram.sol";
import {IERC5679EXT1155 as IERC5679} from "../../interfaces/IERC5679/IERC5679EXT1155.sol";

abstract contract TokenProgramERC5679EXT1155 is AbstractTokenProgram {
    function _safeMint(
        address to,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) internal virtual {
        IERC5679(token()).safeMint(to, id, amount, data);
    }

    function _safeMintBatch(
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) internal virtual {
        IERC5679(token()).safeMintBatch(to, ids, amounts, data);
    }

    function _burn(
        address from,
        uint256 id,
        uint256 amount,
        bytes[] calldata data
    ) internal virtual {
        IERC5679(token()).burn(from, id, amount, data);
    }

    function _burnBatch(
        address from,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) internal virtual {
        IERC5679(token()).burnBatch(from, ids, amounts, data);
    }

    function programTokenType()
        public
        pure
        override
        returns (PROGRAM_TOKEN_TYPE)
    {
        return PROGRAM_TOKEN_TYPE.SEMI_FUNGIBLE_TOKEN;
    }
}
