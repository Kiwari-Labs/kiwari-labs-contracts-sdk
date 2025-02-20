// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

/**
 * @title Abstract Billing
 * @author Kiwari Labs
 */

import {IERC20Metadata} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

// See reference https://killbill.github.io/slate/.

abstract contract AbstractBilling {

    enum BILLING_STATE {
        PENDING,
        ACTIVE,
        BLOCKED,
        CANCELLED
    }

    enum BILLING_PERIOD_TYPE {
        BLOCKS_BASED,
        TIME_BASED
    }

    struct Bill {
        BILLING_STATE state;
        IERC20Metadata currency;
        uint256 start;
        uint256 end;
        uint32 period;
        uint8 overdueThreshold;
        bool blocking;
        mapping(uint256 => uint256) balances;
    }

    mapping(address => Bill) private _bills;

    // modifier

    function _discharge(address account, uint256 billId, uint256 amount) internal {
        // Bill storage bill = _bills[account];
        // bill.currency.transferFrom(account, bill.service);
        // bills[account].balances[billId] -= amount;

        // emit Discharge
    }

    function billingPeriod(address account) public virtual view returns (uint32) {
        return _bills[account].period;
    }

    function billingPeriodType() public virtual view returns (BILLING_PERIOD_TYPE) {
        return BILLING_PERIOD_TYPE.BLOCKS_BASED;
    }

    function currency(address account) public virtual view returns (string memory) {
        return _bills[account].currency.symbol();
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