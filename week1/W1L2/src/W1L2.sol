// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

error IndexOutOfBounds();

contract W1L2 {
    uint256[] private ARR_AFTER_EXECUTION = [0, 1, 10, 3, 4, 5, 6, 9, 11];
    uint256[] private ARR_AFTER_EXECUTION_A = [0, 1, 3, 4, 5, 6, 7, 10, 11];

    uint256[] public arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

    // If the order doesn't matter
    function deleteItem(uint256 i) internal {
        uint256 length = arr.length;
        if (i >= length) revert IndexOutOfBounds();

        arr[i] = arr[length - 1];
        arr.pop();
    }

    // If the order does matter
    function deleteItemA(uint256 i) internal {
        uint256[] memory temp = arr;
        uint256 length = temp.length;
        if (i >= length) revert IndexOutOfBounds();

        for (uint256 j = i; j < length - 1;) {
            temp[j] = temp[j + 1];
            unchecked {
                j++;
            }
        }

        arr = temp;
        arr.pop();
    }

    function execution() external {
        deleteItem(8);
        deleteItem(2);
        deleteItem(7);
    }

    function executionA() external {
        deleteItemA(8);
        deleteItemA(2);
        deleteItemA(7);
    }

    function getArr() external view returns (uint256[] memory) {
        return arr;
    }

    function getArrAfterExecution() external view returns (uint256[] memory) {
        return ARR_AFTER_EXECUTION;
    }

    function getArrAfterExecutionA() external view returns (uint256[] memory) {
        return ARR_AFTER_EXECUTION_A;
    }
}
