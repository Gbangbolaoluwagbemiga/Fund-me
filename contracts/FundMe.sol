// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import {AggregatorV3Interface} from "@chainlink/contracts@1.2.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    uint256 public minimumUsd=5;

    function send() public payable {
   require(msg.value>=minimumUsd, "Not enough Gas");
    }

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

    }

    modifier onlyOwner{
        require("owner");
        _;
    }

    // modifier only owner
    // fallback() 
    // receive
    // withdraw
    // funders
    // amount funded
    // price converter
}
