// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

import {PriceConverter} from "./PriceConverter.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe{
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    address public owner; 

    constructor() {
      owner = msg.sender;
    }

    function fund() public payable {
       msg.value.getConversionRate();
       require(msg.value.getConversionRate() > minimumUsd, "didn't send enough funds");
       funders.push(msg.sender);
       addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    

    function withdraw() public {
        require(msg.sender == owner, "Must be owner!");
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++ ){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the array
        funders = new address[](0);
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }
}