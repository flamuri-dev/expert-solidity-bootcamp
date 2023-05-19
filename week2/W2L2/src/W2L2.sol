// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Q1 {
    function msgValue() external payable returns (uint256 msg_value) {
        assembly {
            msg_value := callvalue()
        }
    }
}
