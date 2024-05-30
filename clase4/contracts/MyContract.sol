// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import "./BaseContract.sol";

contract MyContract is BaseContract {

    constructor() BaseContract(7) {}
    
    function getNumberPlusOne() public view returns(uint) {
        return aNumber + 1;
    }

    
}