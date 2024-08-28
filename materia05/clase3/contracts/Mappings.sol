// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;


contract Mappings {

    // Mapping
    // 0x0....0 -> 0
    // 0xf....f -> 0
    // 0xAb8 -> 300
    // 0x5B3 -> 7
    mapping(address => uint) public myMapping;


    function setMyMapping(uint aNumber) public {
        myMapping[msg.sender] = aNumber;
    }

    function getMyNumber() public view returns(uint) {
        return myMapping[msg.sender];
    }
}