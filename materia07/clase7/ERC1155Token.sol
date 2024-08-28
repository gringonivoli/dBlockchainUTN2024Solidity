// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

// Extra: nos permite consultar el total supply de un token id
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";

contract ERC1155Token is ERC1155, Ownable, ERC1155Supply {
    
    constructor(address initialOwner) ERC1155("") Ownable(initialOwner) {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    // Necesario para agregar la funcionalidad de total supply by token id
    function _update(address from, address to, uint256[] memory ids, uint256[] memory values)
        internal
        override(ERC1155, ERC1155Supply)
    {
        super._update(from, to, ids, values);
    }   

}
