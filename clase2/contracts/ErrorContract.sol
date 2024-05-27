// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

contract ErrorContract {

    uint aNumber;

    error NotOne(uint value, address user);

    function setNumber(uint anotherNumber) public {
        if (anotherNumber != 1) { 
            revert NotOne(anotherNumber, msg.sender);
        }
        aNumber = anotherNumber;
    }
}