// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Pizza is Initializable, UUPSUpgradeable, OwnableUpgradeable {

    uint256 _slices;

    function initialize(uint256 sliceCount, address initialOwner) public initializer {
        _slices = sliceCount;
        __Ownable_init(initialOwner);
    }

    function _authorizeUpgrade(address) internal override onlyOwner {}

    function eatSlice() external {
        require(_slices > 1, "no slices left");
        _slices -= 1;
    }

    function slices() external view returns (uint256) {
        return _slices;
    }
}
