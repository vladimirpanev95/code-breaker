// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // solidity versions; 

contract SimpleStorage {
    // favouriteNumber gets initialized to 0 if no value is given

    uint256 public myFavouriteNumber; // 0 

    struct Person{
        uint256 favouriteNumber;
        string name;
    }

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }

    Person[] public listOfPeople;

    function createPerson(uint _favouriteNumber, string memory _name) public {
        Person memory newPerson = Person(_favouriteNumber, _name);
        listOfPeople.push(newPerson);
    }

    //view, pure
    function retrieve() public  view returns(uint256){
        return myFavouriteNumber;
    }
}