// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFC721 is ERC721URIStorage {
    address public owner;

    using Counters for Counters.Counter;
    Counters.Counter private tokenIds;

    constructor() ERC721("Token721", "TKN721") {
        owner = msg.sender;
    }

    function ownerMint(address _to, string memory _tokenURI) public returns(uint256) {
        require(msg.sender == owner, "Only owner can mint");
        tokenIds.increment();
        uint256 newItemId = tokenIds.current();
        _mint(_to, newItemId);
        _setTokenURI(newItemId, _tokenURI);
        return newItemId;
    }

    function transferOwner(address _owner) public {
        require(msg.sender == owner, "Only owner can transfer");
        owner = _owner;
    }
}
