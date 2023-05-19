// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/*
  interface Isolution1 {
    function solution(uint256[2] calldata firstArray, uint256[2] calldata secondArray) external pure returns (uint256[2] calldata finalArray);
  }
*/

contract Level_1_Solution {
    function solution(uint256[2][2] calldata, uint256[2][2] calldata) external payable returns (uint256[2][2] memory) {
        // Implement your solution here.
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, add(calldataload(4), calldataload(132)))
            mstore(add(ptr, 32), add(calldataload(36), calldataload(164)))
            mstore(add(ptr, 64), add(calldataload(68), calldataload(196)))
            mstore(add(ptr, 96), add(calldataload(100), calldataload(228)))
            return(ptr, 128)
        }
    }
}
