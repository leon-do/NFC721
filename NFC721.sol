// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract ERC721Token is ERC721URIStorage {
    address public owner;

    constructor() ERC721("Token721", "TKN721") {
        owner = msg.sender;
    }

    function ownerMint(address _to, uint256 _tokenId, string memory _tokenURI) public returns(uint256) {
        require(msg.sender == owner, "Only owner can mint");
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, _tokenURI);
        return _tokenId;
    }

    function ownerTransfer(address _owner) public {
        require(msg.sender == owner, "Only owner can transfer");
        owner = _owner;
    }
}
