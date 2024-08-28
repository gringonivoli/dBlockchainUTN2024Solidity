// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract ERC1155TokenReceiver {

    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes calldata data
    ) external pure returns (bytes4) {
        // Otra opción => return this.onERC1155Received.selector;
        return bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"));
    }

    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    ) external pure returns (bytes4) {
        // Otra opción => return this.onERC1155BatchReceived.selector;
        return bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"));
    }
}
