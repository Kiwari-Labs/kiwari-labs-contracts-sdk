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
        mapping(uint256 => uint256) balances;
    }

    mapping(address => Bill) private _bills;

    function _dischargeBill(address account, uint256 billId, uint256 amount) internal {
        Bill storage bill = _bills[account];
        bill.currency.transferFrom(account, address(this), amount);
        bill.balances[billId] -= amount;

        // emit DischargeBill
    }

    function _updateBill(address account, uint256 billId, Bill memory billInfo) internal {
        // @TODO validation/check
        _bill[account] = billInfo;

        // emit UpdateBill
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

    function billBalanceOf(address account, uint256 billId) public virtual view returns (uint256) {
        return _bills[account].balances[billId];
    }

}