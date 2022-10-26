// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => string) public pokemons;
    mapping(address => uint256) public pokemonIndex;

    constructor() {
        console.log("Hi there! I am Simo. Say hi with your favorite pokemon!");
    }

    function getPokemon(address _address) public view returns (string memory) {
        return pokemons[_address];
    }

    function setPokemon(address _address, string memory _pokemon) public {
        pokemons[_address] = _pokemon;
    }

    function getPokemonIndex(address _address) public view returns (uint256) {
        return pokemonIndex[_address];
    }

    function setPokemonIndex(address _address, uint256 _index) public {
        pokemonIndex[_address] = _index;
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}