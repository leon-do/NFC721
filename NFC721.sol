// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract ERC721Token is ERC721URIStorage {
    address public owner;

    mapping (uint256 => string) public username;

    constructor() ERC721("Token721", "TKN721") {
        owner = msg.sender;
    }

    function ownerMint(address _to, uint256 _tokenId, string memory _username, string memory _tokenURI) public {
        require(msg.sender == owner, "Only owner can mint");
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, _tokenURI);
        username[_tokenId] = _username;
    }

    function ownerTransfer(address _owner) public {
        require(msg.sender == owner, "Only owner can transfer");
        owner = _owner;
    }
}
