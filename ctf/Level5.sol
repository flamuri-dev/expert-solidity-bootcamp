// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/*
interface Isolution5 {
    function solution(bytes32 b, bytes32 ex, bytes32 modulus) external returns (bytes32 result);
}
*/

contract Level_5_Solution {
    function solution(bytes32 b, bytes32 ex, bytes32 modulus) external payable returns (bytes32 result) {
        // Implement your solution here.
        assembly {
            mstore(0x80, 0x20)
            mstore(0xA0, 0x20)
            mstore(0xC0, 0x20)
            mstore(0xE0, b)
            mstore(0x100, ex)
            mstore(0x120, modulus)
            if iszero(staticcall(gas(), 0x05, 0x80, 0xc0, 0x80, 0x20)) { revert(0, 0) }
            result := mload(0x80)
        }
    }
}
