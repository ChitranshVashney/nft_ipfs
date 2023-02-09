// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    // string public TOKEN_URI ;
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private TOKEN_URI;

    constructor() ERC721("CallOfDuty", "COD") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        TOKEN_URI[s_tokenCounter]=tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        // require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return TOKEN_URI[tokenId];
    }


    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}