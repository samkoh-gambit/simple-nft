// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleNFT is ERC721, Ownable {
    uint256 private _tokenIdCounter = 1; // Start at 1
    string private _baseTokenURI; // Shared Metadata URI

    constructor(
        string memory baseURI_
    ) ERC721("CyberMints", "CM") Ownable(msg.sender) {
        _baseTokenURI = baseURI_;
    }

    /// @notice Mint function - allows anyone to mint one NFT
    function mint() external {
        uint256 tokenId = _tokenIdCounter;
        _safeMint(msg.sender, tokenId);
        _tokenIdCounter += 1;
    }

    /// @notice Override tokenURI to return the same URI for every tokenId
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(
            ownerOf(tokenId) != address(0),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return _baseTokenURI;
    }

    /// @notice Set a new base URI (only owner)
    function setBaseURI(string calldata newBaseURI) external onlyOwner {
        _baseTokenURI = newBaseURI;
    }

    /// @notice View current base URI (public)
    function getBaseURI() external view returns (string memory) {
        return _baseTokenURI;
    }
}
