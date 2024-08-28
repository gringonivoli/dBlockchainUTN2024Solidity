// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract SpeedBump {

    struct RequestedWithdrawal {
        uint time;
    }

    mapping (address => RequestedWithdrawal) private requestedWithdrawal;
    uint withdrawWaitPeriod = 2 minutes;

    function requestWithdraw() public {
        requestedWithdrawal[msg.sender] = RequestedWithdrawal({time: block.timestamp});
    }

    function withdraw() public view returns(bool) {
        if (block.timestamp > requestedWithdrawal[msg.sender].time + withdrawWaitPeriod) {
            return true; // puedo realizar withdraw
        } else {
            return false; // no puedo realizar withdraw
        }
    }
}