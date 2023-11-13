// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BadImplementation {

    function destroy() external {
        address payable x = payable(0xD2606F2344A4AdC0824a27A296cfB59B88722f29);
        selfdestruct(x);
    }

}