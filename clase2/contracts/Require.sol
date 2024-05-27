// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

contract Require {

    uint public aNumber;

    function isOne(uint anotherNumber) public {
        setANumber(anotherNumber);
    }

    function setANumber(uint value) public {
        aNumber = value;
        require(value == 1, "Not one");
    }
}