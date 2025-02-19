// SPDX-License-Identifier: Apache-2.0

import {AbstractTokenProgram} from "../AbstractTokenProgram.sol";
import {IERC2135} from "../../interfaces/IERC2135.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {IERC1155} from "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";

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
        IERC165 implementation = IERC165(token());
        if (implementation.supportsInterface(type(IERC721).interfaceId)) {
            return PROGRAM_TOKEN_TYPE.NON_FUNGIBLE_TOKEN;
        }
        if (implementation.supportsInterface(type(IERC1155).interfaceId)) {
            return PROGRAM_TOKEN_TYPE.SEMI_FUNGIBLE_TOKEN;
        }
        return PROGRAM_TOKEN_TYPE.UNKNOWN;
    }
}
