// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // solidity versions; 

contract SimpleStorage {
    // favouriteNumber gets initialized to 0 if no value is given

    uint256 public myFavouriteNumber; // 0 

    struct Person{
        uint256 favouriteNumber;
        string name;
    }

    function store(uint256 _favouriteNumber) public virtual {
        myFavouriteNumber = _favouriteNumber;
    }

    Person[] public listOfPeople;
    
    // Maria => 10
    mapping(string => uint256) public nameToFavouriteNumber;

    function createPerson(uint _favouriteNumber, string memory _name) public {
        Person memory newPerson = Person(_favouriteNumber, _name);
        listOfPeople.push(newPerson);
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    //view, pure
    function retrieve() public  view returns(uint256){
        return myFavouriteNumber;
    }
}