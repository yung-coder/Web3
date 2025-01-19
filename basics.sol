// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Myapp {
    mapping(uint256 => string) public  names;
    mapping(uint256 => Book) public books;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    struct Book {
        string title;
        string author;
    }

    // constructor() {
    //     names[1] = "chad";
    //     names[2] = "nad";
    //     names[3] = "lad";
    // }

    function addBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
    }

    // looping

    uint[]  public numbers = [1,2,3,4,5,6,7,8];

    function countEvenNumbers() public view returns(bool) {

        for (uint i = 0; i < numbers.length ; i++){
            if(numbers[i] == 83) {
                return true;
            }
        }

        return  false;
    }


    function isOwner() public  view  returns (bool) {
        return(msg.sender ==  owner);
    }
}
