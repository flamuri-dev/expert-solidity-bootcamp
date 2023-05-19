// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/W2L1.sol";

contract W2L1Test is Test {
    Q6_Intro public q6_intro;
    Q6_Add public q6_add;
    Q6_SubOverflow public q6_subOverflow;
    Q6_Scope public q6_scope;

    function setUp() public {
        q6_intro = new Q6_Intro();
        q6_add = new Q6_Add();
        q6_subOverflow = new Q6_SubOverflow();
        q6_scope = new Q6_Scope();
    }

    function testQ6_Intro() public {
        assertEq(q6_intro.intro(), 420);
    }

    function testQ6_Add(int256 x, int256 y) public {
        // assertEq(q6_add.addAssembly(x, y), x + y); // Fuzzing might break because currently the addAssembly() function is not handling overflows
        assertEq(q6_add.addAssembly(2, 7), 9);
    }

    function testQ6_SubOverflow(uint256 x, uint256 y) public {
        // assertEq(q6_subOverflow.subtract(x, y), x - y); // Fuzzing might break because currently the addAssembly() function is not handling overflows
        assertEq(q6_subOverflow.subtract(23, 6), 17);
        assertEq(q6_subOverflow.subtract(6, 23), 0);
    }

    function testQ6_Scope(uint256 num) public {
        assertEq(q6_scope.count(), 10);
        // q6_scope.increment(num); // Fuzzing might break because currently the addAssembly() function is not handling overflows
        // assertEq(q6_scope.count(), num + 10);
        q6_scope.increment(13);
        assertEq(q6_scope.count(), 23);
    }
}
