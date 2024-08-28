
// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTMarketplace {

    error NotOwner();
    error NoProceeds();
    error PriceMustBeAboveZero();
    error NotApprovedForMarketplace();
    error PriceNotMet(address nftAddress, uint256 tokenId, uint256 price);
    error AlreadyListed(address nftAddress, uint256 tokenId);

    event NFTListed(
        address indexed seller,
        address indexed nftAddress,
        uint256 indexed tokenId,
        uint256 price
    );

    event NFTCanceled(
        address indexed seller,
        address indexed nftAddress,
        uint256 indexed tokenId
    );

    event NFTBought(
        address indexed buyer,
        address indexed nftAddress,
        uint256 indexed tokenId,
        uint256 price
    );

    struct NFTInfo {
        uint price;
        address seller;
    }

    mapping(address seller => uint balance) private _sellersProceeds;
    mapping(address nftAddress => mapping(uint tokenId => NFTInfo)) private _nftList;

    modifier notListed(
        address nftAddress,
        uint256 tokenId
    ) {
        if (_nftList[nftAddress][tokenId].price > 0) {
            revert AlreadyListed(nftAddress, tokenId);
        }
        _;
    }

    modifier isListed(
        address nftAddress,
        uint256 tokenId
    ) {
        if (_nftList[nftAddress][tokenId].price == 0) {
            revert AlreadyListed(nftAddress, tokenId);
        }
        _;
    }

    modifier isOwner(
        address nftAddress,
        uint256 tokenId,
        address spender
    ) {
        if (spender != IERC721(nftAddress).ownerOf(tokenId)) {
            revert NotOwner();
        }
        _;
    }

    function listNFT(address nftAddress, uint tokenId, uint price) 
        external 
        notListed(nftAddress, tokenId)
        isOwner(nftAddress, tokenId, msg.sender)
    {
        if (price <= 0) {
            revert PriceMustBeAboveZero();
        }
        if (IERC721(nftAddress).getApproved(tokenId) != address(this)) {
            revert NotApprovedForMarketplace();
        }
        _nftList[nftAddress][tokenId] = NFTInfo(price, msg.sender);
        emit NFTListed(msg.sender, nftAddress, tokenId, price);
    }

    function cancelNFT(address nftAddress, uint tokenId) 
        external
        isOwner(nftAddress, tokenId, msg.sender)
        isListed(nftAddress, tokenId) 
    {
        delete _nftList[nftAddress][tokenId];
        emit NFTCanceled(msg.sender, nftAddress, tokenId);
    }

    function buyNFT(address nftAddress, uint tokenId) 
        external
        payable 
        isListed(nftAddress, tokenId)
    {
        NFTInfo memory listedNFT = _nftList[nftAddress][tokenId];
        if (msg.value < listedNFT.price) {
            revert PriceNotMet(nftAddress, tokenId, listedNFT.price);
        }
        // send the money? pull over push
        _sellersProceeds[listedNFT.seller] += msg.value;
        delete _nftList[nftAddress][tokenId];
        IERC721(nftAddress).safeTransferFrom(listedNFT.seller, msg.sender, tokenId);
        emit NFTBought(msg.sender, nftAddress, tokenId, listedNFT.price);
    }

    function withdrawProceeds() external {
        uint proceeds = _sellersProceeds[msg.sender];
        if (proceeds <= 0) {
            revert NoProceeds();
        }
        _sellersProceeds[msg.sender] = 0;
        (bool success,) = msg.sender.call{value: proceeds}(""); // external calls always after storage changes
        require(success, "Transfer failed");
    }

    function updateNFT(address nftAddress, uint tokenId, uint newPrice) 
        external 
        isListed(nftAddress, tokenId)
        isOwner(nftAddress, tokenId, msg.sender)
    {
        if (newPrice <= 0) {
            revert PriceMustBeAboveZero();
        }
        _nftList[nftAddress][tokenId].price = newPrice;
        emit NFTListed(msg.sender, nftAddress, tokenId, newPrice);
    }

    function getNFTInfo(address nftAddress, uint tokenId) external view returns(NFTInfo memory) {
        return _nftList[nftAddress][tokenId];
    }

    function getProceeds() external view returns(uint) {
        return _sellersProceeds[msg.sender];
    }

    function getProceeds(address seller) external view returns(uint) {
        return _sellersProceeds[seller];
    }
}
