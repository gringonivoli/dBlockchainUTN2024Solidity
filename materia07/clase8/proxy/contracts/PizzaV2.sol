// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "./Pizza.sol";

contract PizzaV2 is Pizza {

    uint256 private _dummy;

    function refillSlice() external {
        _slices += 1;
    }

    function dummy() external view returns (uint256) {
        return _dummy;
   }

    function setDummy(uint256 aDummyValue) external {
      _dummy = aDummyValue;
    }
}
