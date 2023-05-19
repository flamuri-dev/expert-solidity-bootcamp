// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/*
interface Isolution5 {
    function solution(address owner, bytes32 messageHash, uint8 v, bytes32 r, bytes32 s) external pure 
    returns (bool isSignedByOwner);
}
*/

contract Level_6_Solution {
    function solution(bytes32 messageHash, uint8 v, bytes32 r, bytes32 s) external payable returns (address signer) {
        bytes32 fullMessage = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash));
        signer = ecrecover(fullMessage, v, r, s);
    }
}
