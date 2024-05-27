// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;


contract Events {

    uint public aNumber;

    event MyEvent(address indexed user, uint value);

    function setNumber(uint anotherNumber) public {
        aNumber = anotherNumber;
        emit MyEvent(msg.sender, anotherNumber);
    }

    function setNumber2(uint anotherNumber) public {
        aNumber = anotherNumber;
    }
}
