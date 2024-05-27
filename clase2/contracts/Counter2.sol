// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

contract Counter2 {
    
    uint count;
    address owner;

    error NotOwner();

    constructor() {
        owner = msg.sender;
    }

    function get() public view returns(uint) {
        return count;
    }

    function inc() public {
        require(msg.sender == owner, "Not owner");
        count += 1;
    }

    function dec() public {
        if (msg.sender != owner) {
            revert NotOwner();
        }
        count -= 1;
    }
}