// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFTContract is ERC721, Ownable {

    constructor(address initialOwner) 
        ERC721("MyNFTContract", "MNC") 
        Ownable(initialOwner) 
    {}

    function mint(address to, uint tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}