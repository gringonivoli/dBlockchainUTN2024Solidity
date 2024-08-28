// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

contract BaseFunctions {

    // Private function can only be called inside this contract
    // Contracts that inherit this contract cannot call this function.
    function privateFunction() private pure returns(uint) {
        return 3;
    }

    function testPrivateFunction() public pure returns(uint) {
        return privateFunction();
    }

    // Internal function can be called inside this contract
    // and inside contracts that inherit this contract
    function internalFunction() internal pure returns(uint) {
        return 7;
    }

    function testInternalFunction() public pure returns(uint) {
        return internalFunction();
    }
    
    // External functions can only be called
    // - by other contracts and accounts
    function externalFunction() external pure returns(uint) {
        return 2;
    }

    // function testExternalFunction() public pure returns(uint) {
    //    return externalFunction();
    // }
}

contract Functions is BaseFunctions {

    // function testPrivateFunction2() public pure returns(uint) {
    //    return privateFunction();
    // }
    function testInternalFunction2() public pure returns(uint) {
        return internalFunction();
    }

    //function testExternalFunction() public pure returns(uint) {
    //    return externalFunction();
    //}
}