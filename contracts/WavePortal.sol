// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract SmartPortal {
    uint256 waveCount;
    event NewWave(address indexed from, string character, uint256 characterIndex, string message, uint256 timestamp);

    struct Wave {
        address waver; // The address of the user who waved.
        string character; // The character the user chose.
        uint256 characterIndex; // The index of the character on the front end api.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

    Wave[] waves;

    constructor() payable {
        console.log("Hi there! I am Simo. Say hi with your favorite superhero!");
    }

    function wave(string memory _character, uint256 _characterIndex, string memory _message) public {
        waveCount += 1;
        console.log("%s waved w/ message %s", msg.sender, _message);

        waves.push(Wave(msg.sender, _character, _characterIndex, _message, block.timestamp));

        emit NewWave(msg.sender, _character, _characterIndex, _message, block.timestamp);

        uint256 prizeAmount = 0.0001 ether;
        require(
            prizeAmount <= address(this).balance,
            "Trying to withdraw more money than the contract has."
        );
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to withdraw money from contract.");
        }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getWaveStatus() public view returns (uint256) {
        console.log("Current wave count: %d", waveCount);
        return waveCount;
    }
}