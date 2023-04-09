// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PaymentContract {
    function pay(address payable receiver) public payable {
        require(msg.value > 0, "Payment amount must be greater than zero.");
        receiver.transfer(msg.value);
    }
}