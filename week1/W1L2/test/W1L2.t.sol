// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/W1L2.sol";

contract W1L2Test is Test {
    W1L2 public w1l2;

    function setUp() public {
        w1l2 = new W1L2();
    }

    function testDeleteItem() public {
        w1l2.execution();
        assertEq(w1l2.getArr(), w1l2.getArrAfterExecution());
    }

    function testDeleteItemA() public {
        w1l2.executionA();
        assertEq(w1l2.getArr(), w1l2.getArrAfterExecutionA());
    }
}
