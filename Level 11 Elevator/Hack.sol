// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
  function goTo(uint _floor) external;
}

interface Building {
  function isLastFloor(uint) external returns (bool);
}

contract myBuilding is Building {
    IElevator elevator;
    bool public top = true;

    constructor(address _elevator) {
        elevator = IElevator(_elevator);
    }

    function isLastFloor(uint _floor2) public returns(bool) {
        top = !top;
        return top;
    }

    function myGoTo(uint _floor) public {
        elevator.goTo(_floor);
    }

}
