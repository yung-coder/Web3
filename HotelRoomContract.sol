// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {

    // vacant 
    //Occupied 

    enum Statuses { Vacant , Occupied }

    Statuses public  curentStatus;

    event Ocuupy(address _occupant, uint _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        curentStatus = Statuses.Vacant;
    }

    modifier  onlyWhileVacant {
         require(curentStatus == Statuses.Vacant, "currently occupied");
         _;
    }


    modifier  costs(uint _amount) {
        require(msg.value >= _amount, "Not enough ether provided");
        _;
    }

    function book() public  payable onlyWhileVacant costs(2 ether){
        curentStatus = Statuses.Occupied;

        (bool sent , bytes memory data) = owner.call{value: msg.value}("");

        require(true);

        emit Ocuupy(msg.sender, msg.value);
    }


}