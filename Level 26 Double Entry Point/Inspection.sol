// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Inspection {
    
    function inspect(address _legacyAddress) view public returns(address) {
        return LegacyToken(_legacyAddress).delegate();
    }

    function sweep(address _vault, address __legacyAddress) public {
        CryptoVault(_vault).sweepToken(__legacyAddress);
    }
}

contract CryptoVault {
    function sweepToken(address token) public {}
}

contract LegacyToken {
    address public delegate;
}