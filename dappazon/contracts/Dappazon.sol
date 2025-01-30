// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Dappazon {
    string public name;
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
}


