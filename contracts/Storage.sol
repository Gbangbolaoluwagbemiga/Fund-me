// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Storage{
    uint256  counter;

    function set(uint256 _X) public {
      counter = _X ;
    }
    function get() public view returns(uint256){
     return counter ;
    }
}