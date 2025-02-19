// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

/**
 * @title Abstract Billing
 * @author Kiwari Labs
 */

import {IERC20Metadata} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

abstract contract AbstractBilling {

    enum BILLING_PERIOD_TYPE {
        BLOCKS_BASED,
        TIME_BASED
    }

    IERC20Metadata private _token;
    uint256 private _billPeriod;
    uint8 private _overdueThreshold;

    // sliding window
    // mapping(address => Epoch) _billCycle;

    // constructor

    function currency() public virtual view returns (string memory) {
        return _token.symbol();
    }

    function discharge(uint256 billId, uint256 amount) public virtual {
        // @TODO
        // _token.transferFrom(msg.sender, amount);
        // bills[account][billId].balance -= amount;
    }

    function billingPeriod() public virtual view returns (uint256) {
        return _billPeriod;
    }

    function billingPeriodType() public virtual view returns (BILLING_PERIOD_TYPE) {
        return BILLING_PERIOD_TYPE.BLOCKS_BASED;
    }

    function overdueBalanceOf(address account) public virtual view returns (uint256) {
        // @TODO look back bill by threshold
        // uint256 toBill = currentBillOf(account);
        // uint256 fromBill = toBill - _overdueThreshold;
        // uint256 overdueBalance = getBill(account, toBill);
        // while (fromBill != toBill) {
        //      overBill += getBIll(account, fromBill);
        //      fromBill++;
        // }
        // return overdueBalance;
        return 0;
    }

    function outstandingBalanceOf(address account) public virtual view returns (uint256) {
        // return getBill(account, currentBillOf(account));
        return 0;
    }

}