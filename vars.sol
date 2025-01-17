// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContreact {
    // state vars

    int256 public Myint = 1;
    uint256 public myUint = 2;
    uint256 public myuint256 = 4;
    uint8 public myUint8 = 1;

    string public myString = "Hey Solidity";
    bytes32 public myBytes = "Array type";

    address public myaddress;

    struct Mystruct {
        uint256 myUint;
        string myString;
    }

    Mystruct public mystruct = Mystruct(1, "Hey check");

    // local vars

    function getVal() public pure returns (uint256) {
        uint256 value = 1;
        return value;
    }

    uint256[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["apple", "mango", "chad"];
    string[] public valuear;

    function addValue(string memory _value) public {
        valuear.push(_value);
    }

    function valCount() public view returns (uint256) {
        return valuear.length;
    }


    // 2-d array 

    uint256[][] public my2darray = [[1,2,3], [4,5,6]];

    
}