// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract NFTMarketplace {

    struct NFTInfo {
        uint price;
        address seller;
    }

    mapping(address nftContract => mapping(uint tokenId => NFTInfo)) private nftList;

    function listNFT(address nftContract, uint tokenId, uint price) external {
        // cosas a validar
        // no este listado
        // nft owner
        // price > 0
        // NFT approved -> (???)
        nftList[nftContract][tokenId] = NFTInfo(price, msg.sender);
        // emit event
    }

    function getNFTInfo(address nftContract, uint tokenId) external view returns(NFTInfo memory) {
        return nftList[nftContract][tokenId];
    }
}