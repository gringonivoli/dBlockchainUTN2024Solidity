// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;


contract FunctionModfiers {

    address owner;
    uint public aNumber;

    error NotOwner();
    error NotOne();

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (owner != msg.sender) {
            revert NotOwner();
        }
        _; // setNumber..
        if (aNumber != 1) {
            revert NotOne();
        }
    }

    function setNumber(uint anotherNumber) public onlyOwner {
        aNumber = anotherNumber;
    }
}