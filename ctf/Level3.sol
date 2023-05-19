// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Level_3_Solution {
    function solution(address _addr) external payable returns (uint256 codeSize) {
        assembly {
            codeSize := extcodesize(_addr)
        }
    }
}
