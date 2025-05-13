// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Over-The-Counter Trade (OTC) inspired from ERC6123
 * @dev  https://eips.ethereum.org/EIPS/eip-6123
 */

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {AddressComparators} from "../libraries/comparators/AddressComparators.sol";
import {BoolComparators} from "../libraries/comparators/BoolComparators.sol";
import {UIntComparators} from "../libraries/comparators/UIntComparators.sol";

abstract contract AbstractOverTheCounterTrade {
    using AddressComparators for address;
    using BoolComparators for bool;
    using UIntComparators for uint256;

    enum TRADE_STATE {
        INACTIVE,
        INCEPTED,
        CONFIRMED,
        TERMINATED
    }

    struct Trade {
        address initiator;
        address responder;
        TRADE_STATE state;
        bytes tradeData;
        bytes terminationData;
        // implementation;
    }

    uint8 public constant MAX_PENDING_TRADE = 64;

    address private _partyA;
    address private _partyB;

    IERC20 private _tokenA;
    IERC20 private _tokenB;

    mapping(bytes32 => Trade) private _trades;
    mapping(address => uint8) private _pendingTrades;
    mapping(uint256 => bytes32) private _tradeIds;
    mapping(address => uint256) private _nonces;

    uint256 private _counter;

    constructor (address partyA, address partyB, IERC20 tokenA, IERC20 tokenB) {
        _partyA = partyA;
        _partyB = partyB;
        _tokenA = tokenA;
        _tokenB = tokenB;
    }

    modifier whenTradeIncepted(bytes32 tradeId) {
        if (_trades[tradeId].state != TRADE_STATE.INCEPTED) {
            // not allow other status
            revert ();
        }
        _;
    }

    function _processTradeAfterConfirmation(bytes32 tradeId) private {
        // move/transfer token
    }

    function _processCancelAfterTermination(bytes32 tradeId) private {
        // e.g. penalty
    }

    function _updateTradeData(bytes32 tradeId, bytes memory tradeData) internal whenTradeIncepted {
        _trades[tradeId].tradeData = tradeData;
    }

    function _updateTerminationData(bytes32 tradeId, bytes memory terminationData) internal whenTradeIncepted {
        _trades[tradeId].terminationData = terminationData;
    }

    function inceptTrade(address withParty, bytes memory tradeData, bytes32 terminationData) external returns (bytes32 memory) {
        address initiator = msg.sender;
        if ((initiator.notEqual(_partyA)).or(initiator.notEqual(_partyB))) {
            // not in trade
            revert ();
        }
        if (initiator.notEqual(withParty)) {
            // not allow self trade
            revert ();
        }
        if (_pendingTrades[initiator].lessThan(MAX_PENDING_TRADE)) {
            bytes32 tradeId = (keccak256(abi.encode(initiator, withParty, tradeData, _nonces[initiator], block.chainid)));
            _trades[tradeId].tradeData = tradeData; 
            _trades[tradeId].terminationData = terminationData;
            _trades[tradeId].state = TRADE_STATE.INCEPTED;
            _trades[tradeId].initiator = initiator;
            _trades[tradeId].responder = withParty;
            _pendingTrades[initiator]++;
            _counter++;
            _tradeIds[_counter];

            // emit TradeIncepted(initiator, withParty, tradeId);

            return tradeId;
        } else {
            // exceed
            revert ();
        }
    }

    function cancelTrade(bytes32 tradeId) external whenTradeIncepted {
        address sender = msg.sender;
        if ((sender.notEqual(_partyA)).or(sender.notEqual(_partyB))) {
            // not in trade
            revert ();
        }
        _trades[tradeId].state = TRADE_STATE.TERMINATED;
        address initiator = _trades[tradeId].initiator; 
        _pendingTrades[initiator]--;

        // emit TradeTerminated(initiator, _trades[tradeId].responder, tradeId);

        _processCancelAfterTermination(tradeId);
    }

    function confirmTrade(bytes32 tradeId) external override whenTradeIncepted {
        address sender = msg.sender;
        if (sender.notEqual(_trades[tradeId].responder)) {
            revert ();
        }
        _trades[tradeId].state  = TRADE_STATE.CONFIRMED;
        address initiator = _trades[tradeId].initiator; 
        _pendingTrades[initiator]--;

        // emit TradeConfirmed(initiator, sender, tradeId);

        _processTradeAfterConfirmation(tradeId);
    }

    function tradeIdByIndex(uint256 index) public view returns (bytes32) {
        return _tradeIds[index];
    }

    function tradeData(bytes32 tradeId) public view returns (bytes memory) {
        return _trades[tradeId].tradeData;
    }

    function terminationData(bytes32 tradeId) public view returns (bytes memory) {
        return _trades[tradeId].terminationData;
    }

    function tradeInitiator(bytes32 tradeId) public view returns (address) {
        return _trades[tradeId].initiator;
    }

    function tradeResponder(bytes32 tradeId) public view returns (address) {
        return _trades[tradeId].responder;
    }

    function tradeState(bytes32 tradeId) public view returns (TRADE_STATE) {
        return _trades[tradeId].state;
    }

    function partyA() public view returns (address) {
        return _partyA;
    }

    function partyB() public view returns (address) {
        return _partyB;
    }

    function tokenA() public view returns (address) {
        return address(_tokenA);
    }

    function tokenB() public view returns (address) {
        return address(_tokenB);
    }

    function counts() public view returns (uint256) {
        return _counter;
    }
}
