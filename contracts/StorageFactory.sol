// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // solidity versions; 

import {SimpleStorage} from "contracts/SimpleStorage.sol";

contract StorageFactory{

   SimpleStorage public simpleStorage;

   function createSimpleStorageContract() public {
       simpleStorage = new SimpleStorage();
   }

}