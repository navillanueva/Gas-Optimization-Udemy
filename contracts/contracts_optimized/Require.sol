// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedRequire {
    uint256 constant COOLDOWN = 1 minutes;
    uint256 lastPurchaseTime;

    function purchaseToken() external payable {
        // separating the requires makes it more gas efficient
        require(msg.value == 0.1 ether, 'cannot purchase');
        require(block.timestamp > lastPurchaseTime, 'window closes');
        // adding the cooldown directly to our last purchase so we dont have to add it every time someones calls the function
        // it wont overflow because the block timestamp plus 1 minutes is always going to be a uint256
        unchecked {
            lastPurchaseTime = block.timestamp + COOLDOWN;
        }

        // mint the user a token
    }
}
