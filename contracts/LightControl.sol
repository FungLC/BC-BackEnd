// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract LightControl {
    bool public isOn;

    function turnOn() public {
        isOn = true;
        // TODO: Send a signal to turn the light on
    }

    function turnOff() public {
        isOn = false;
        // TODO: Send a signal to turn the light off
    }
}