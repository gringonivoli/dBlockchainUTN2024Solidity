// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import "@openzeppelin/contracts/access/Ownable.sol";

contract EthWallet is Ownable {

    event EthReceive(uint amoung);

    constructor(address initialAddress) Ownable(initialAddress) {}

    receive() external payable { 
        emit EthReceive(msg.value);
    }

    function receiveEth() external payable {}

    function withdraw(uint amount) external onlyOwner {
        (bool success,) =  owner().call{value: amount}("");
        require(success, "ETH transfer fail");
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}
