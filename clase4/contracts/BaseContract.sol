// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

contract BaseContract {

    uint public aNumber;

    constructor(uint value) {
        aNumber = value;
    }

    function setNumber(uint anotherNumber) public {
        aNumber = anotherNumber;
    }
}