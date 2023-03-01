// SPDX-License-Identifier: GPL-3.0

/**
 * @title Optimization of ../ArraySum.sol
 * @author Nicolas Arnedo Villanueva
 * @notice this is a problem set for the Udemy Gas Optimization course
 */
pragma solidity 0.8.15;

contract OptimizedArraySum {
    uint256[] array;

    function setArray(uint256[] calldata _array) external {
        require(_array.length < 11, 'too long'); // using <= is more expensive than just using <
        array = _array;
    }

    function getArraySum() external view returns (uint256) {
        uint256 sum;
        for (uint256 i = 0; i < array.length; i++) {
            sum += array[i];
        }

        return sum;
    }
}
