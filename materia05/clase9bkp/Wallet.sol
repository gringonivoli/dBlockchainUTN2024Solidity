// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Wallet is Ownable {

    constructor(address initialOwner) Ownable(initialOwner) {}

    receive() external payable {
        // emit ....
    }
    // fallback() external payable {}

     function withdraw(uint _amount) external onlyOwner{
        (bool success, ) = owner().call{value: _amount}("");
        require(success, "ETH Transfer fail");
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

