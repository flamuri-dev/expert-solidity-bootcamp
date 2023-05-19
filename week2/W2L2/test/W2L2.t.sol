// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/W2L2.sol";

contract W2L2Test is Test {
    Q1 public q1;

    function setUp() public {
        q1 = new Q1();
    }

    function testQ1() public {
        uint256 msgValue = 1 ether;
        assertEq(q1.msgValue{value: msgValue}(), msgValue);
    }
}
