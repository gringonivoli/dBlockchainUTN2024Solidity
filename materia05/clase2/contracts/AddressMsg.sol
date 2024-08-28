// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

contract AddressMsg {
    
    address user;

    constructor() {
        user = msg.sender;
    }

    function setUser() public {
        user = msg.sender;
    }

    function getUser() public view returns(address) {
        return user;
    }

    function getUser2() public view returns(address) {
        return msg.sender;
    }
}