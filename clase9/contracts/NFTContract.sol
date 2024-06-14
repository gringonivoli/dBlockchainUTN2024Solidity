// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTContract is ERC721 {

    constructor() ERC721("NFTContract", "MNC") {}

    function mint(address to, uint tokenId) public {   
        _safeMint(to, tokenId);
    }
}