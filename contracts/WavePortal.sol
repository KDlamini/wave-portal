// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract SmartPortal {
    uint256 totalWaves;
    mapping(address => string) public characters;
    mapping(address => uint256) public characterIndex;

    constructor() {
        console.log("Hi there! I am Simo. Say hi with your favorite pokemon!");
    }

    function getCharacter(address _address) public view returns (string memory) {
        return characters[_address];
    }

    function setCharacter(address _address, string memory _character) public {
        characters[_address] = _character;
    }

    function getCharacterIndex(address _address) public view returns (uint256) {
        return characterIndex[_address];
    }

    function setCharacterIndex(address _address, uint256 _index) public {
        characterIndex[_address] = _index;
    }

    function wave(address _address, string memory _character, uint256 _index) public {
        totalWaves += 1;
        setCharacter(_address, _character);
        setCharacterIndex(_address, _index);
    }

    function getWaveStatus() public view returns (uint256) {
        console.log("%s has waved!", msg.sender);
        console.log("Waver's favorite superhero/villain is %s", getCharacter(msg.sender));
        console.log("Character ID: %d", getCharacterIndex(msg.sender));
        return totalWaves;
    }
}