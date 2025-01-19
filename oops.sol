// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// oops like concepts 

contract Ownable {
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

contract SecertVault {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns (string memory) {
        return secret;
    }
}

contract MyContract is Ownable {
    address secretVault;

    constructor(string memory _secret) {
        SecertVault _secertVault = new SecertVault(_secret);
        secretVault = address(_secertVault);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return SecertVault(secretVault).getSecret();
    }
}