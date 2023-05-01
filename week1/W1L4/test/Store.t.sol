// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Store.sol";

contract StoreTest is Test {
    Store public store;

    function setUp() public {
        store = new Store();
    }
}
