// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/**
 * @title Preset ERC-7818 Token
 * @author Kiwari Labs
 */

import {IERC5679EXT20 as IERC5679} from "./interfaces/IERC205679EXT20.sol";
import "@kiwarilabs/contracts/tokens/ERC20/ERC20EXPBase.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC7818 is ERC20EXPBase, IERC5679, Ownable {
    // @TODO adding base contract
}
