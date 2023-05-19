// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_4_Solution {
    constructor() {
        assembly {
            sstore(3, 1)
        }
    }

    function solution(uint256 value) external payable {
        assembly {
            sstore(3, calldataload(4))
        }
    }
}
