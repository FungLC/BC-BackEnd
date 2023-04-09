// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Hotel {
    address payable public owner;
    uint public dailyRate;
    uint public totalDays;
    uint public totalCost;
    mapping(address => uint) public guestBalances;
    mapping(address => bool) public guestsCheckedIn;

    constructor(address payable ownerAddress) {
        owner = ownerAddress;
        dailyRate = 1 ether;
        totalDays = 7;
        totalCost = dailyRate * totalDays;
    }

    function checkIn() public payable {
        require(!guestsCheckedIn[msg.sender], "Already checked in");
        require(msg.value == totalCost, "Incorrect payment amount");
        guestBalances[msg.sender] = msg.value;
        guestsCheckedIn[msg.sender] = true;
    }

    function checkOut() public {
        require(guestsCheckedIn[msg.sender], "Not checked in");
        uint refund = guestBalances[msg.sender] - dailyRate * 5;
        guestBalances[msg.sender] = 0;
        guestsCheckedIn[msg.sender] = false;
        payable(msg.sender).transfer(refund);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(address(this).balance > totalCost, "Not enough balance");
        owner.transfer(address(this).balance - totalCost);
    }
}
