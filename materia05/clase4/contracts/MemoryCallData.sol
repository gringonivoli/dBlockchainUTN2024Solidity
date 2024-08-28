// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

contract MemoryCallData {

    string myValue;
    uint aNumber;

    function setMyValue(string memory anotherValue) public {
        // anotherValue = "otra cosa";
        myValue = anotherValue;
    }

    function setMyValue2(string calldata anotherValue) public {
        myValue = anotherValue;
    }

    function getMyValue() public view returns(string memory) {
        return myValue;
    }

    function setANumber(uint anotherNumber) public {
        aNumber = anotherNumber;
    }
}