// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackPreservation {
    uint a;
    uint b;
    address owner;

    function setTime(uint256) public {
        owner = msg.sender;
    }

}
