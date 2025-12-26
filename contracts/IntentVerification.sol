// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract IntentVerification {

    struct Intent {
        address agent;
        string action;
        bool approved;
    }

    mapping(uint256 => Intent) public intents;
    uint256 public intentCount;

    function createIntent(string memory _action) public returns (uint256) {
        intentCount++;
        intents[intentCount] = Intent(msg.sender, _action, false);
        return intentCount;
    }

    function approveIntent(uint256 _intentId) public {
        intents[_intentId].approved = true;
    }

    function isApproved(uint256 _intentId) public view returns (bool) {
        return intents[_intentId].approved;
    }
}
