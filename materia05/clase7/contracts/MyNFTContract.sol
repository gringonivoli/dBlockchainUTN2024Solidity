// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyNFTContract is ERC721, ERC721URIStorage, Ownable {

    IERC20 private _erc20Token;

    constructor(address initialOwner, address erc20Token) 
        ERC721("MyNFTContract", "MNC") 
        Ownable(initialOwner) 
    {
        _erc20Token = IERC20(erc20Token);
    }

    function mint(address to, uint tokenId, string memory uri) public {
        if (_erc20Token.balanceOf(msg.sender) < 1e18) {
            revert(); // podríamos agregar un error
        }
        _erc20Token.transferFrom(msg.sender, address(this), 1000);
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns(string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns(bool) {
        return super.supportsInterface(interfaceId);
    }

    function withdraw(uint amount) public onlyOwner {
        _erc20Token.transfer(owner(), amount);
    }

    function withdrawAll() public onlyOwner {
        _erc20Token.transfer(owner(), _erc20Token.balanceOf(address(this)));
    }
}