// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";//library to import the token erc721 as its the token for nfts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";//library to import enumerable which allows to contract to be payable
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";//library to import uri(uniform resource identifier) this stores the metadata of the smartcontract


contract Alchemy is ERC721, ERC721Enumerable, ERC721URIStorage{

    uint256 MAX_SUPPLY =10000;
    
    constructor() ERC721("Rosario", "KAMI") {}

    function safeMint(address to, uint256 tokenId, string memory uri) public   
    {
        require(tokenId <= MAX_SUPPLY , "Im sorry all NFTS have been minted");
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
