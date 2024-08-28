
// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract NftMarketplace {
    struct NFTInfo {
        uint256 price;
        address seller;
    }

    mapping(address => mapping(uint256 => NFTInfo)) private s_listings;

    function listNFT( 
        address nftAddress,
        uint256 tokenId,
        uint256 price
    )
        external
    {
        // Conditions:
        // - no listed
        // - who listed must be owner
        // - price > 0
        // - NFT approved for market contract    
        s_listings[nftAddress][tokenId] = NFTInfo(price, msg.sender);
        // - emit event
    }

    function cancelNFT(address nftAddress, uint256 tokenId) 
        external
    {
        // Conditions:
        // - who cancel must be owner
        // - is listed
        delete (s_listings[nftAddress][tokenId]);
        // - emit event
    }

    function updateListing(
        address nftAddress,
        uint256 tokenId,
        uint256 newPrice
    )
        external
    {
        // Conditions:
        // - who cancel must be owner
        // - is listed
        // - price > 0
        s_listings[nftAddress][tokenId].price = newPrice;
        // - emit event
    }

    function getNFTInfo(address nftAddress, uint256 tokenId)
        external
        view
        returns (NFTInfo memory)
    {
        return s_listings[nftAddress][tokenId];
    }
}
