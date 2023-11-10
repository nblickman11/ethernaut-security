// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract HackDexTwo is ERC20 {
    constructor(uint supply) ERC20("Evil", "E") {
        _mint(msg.sender, supply);
    }
}