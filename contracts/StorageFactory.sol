// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
import {Storage} from "./Storage.sol";

contract SF{
 Storage[] public sfactory;

 function createContract() public{
    Storage newcontract =new Storage();
    sfactory.push(newcontract);
 }

function sfGet(uint256 CA) public view returns(uint256){
 Storage getCA= sfactory[CA];
 uint getValue= getCA.get();
return getValue;
}
function sfSet(uint256 CA, uint256 _value) public  {
 Storage getCA= sfactory[CA];
 getCA.set(_value);
}


}