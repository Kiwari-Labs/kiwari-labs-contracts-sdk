// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

library AddressComparators {
    function equal(address x, address y) internal pure returns (bool) {
        assembly {
            let m := mload(0x40)
            mstore(m, eq(x, y))
            return(m, 0x20)
        }
    }

    function notEqual(address x, address y) internal pure returns (bool) {
        assembly {
            let m := mload(0x40)
            mstore(m, not(eq(x, y)))
            return(m, 0x20)
        }
    }
}