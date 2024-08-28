// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;


contract SpeedBump {

    struct RequestedWithdrawal {
        uint time;
    }

    mapping (address => RequestedWithdrawal) private requestedWithdrawals;
    uint withdrawalWaitPeriod = 2 minutes;

    function requestWithdrawal() public {
        requestedWithdrawals[msg.sender] = RequestedWithdrawal({time: block.timestamp});
    }

    function withdraw() public view returns(bool){
        if(block.timestamp > requestedWithdrawals[msg.sender].time + withdrawalWaitPeriod) {
            return true; 
        } else {
            return false;
        }
    }
}


