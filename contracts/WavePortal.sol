// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => string) public pokemons;
    mapping(address => string) public pokemonSprites;
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

    function getPokemonSprite(address _address) public view returns (string memory) {
        return pokemonSprites[_address];
    }

    function setPokemonSprite(address _address, string memory _pokemonSprite) public {
        pokemonSprites[_address] = _pokemonSprite;
    }

    function getPokemonIndex(address _address) public view returns (uint256) {
        return pokemonIndex[_address];
    }

    function setPokemonIndex(address _address, uint256 _index) public {
        pokemonIndex[_address] = _index;
    }

    function wave(address _address, string memory _pokemon, string memory _pokemonSprite, uint256 _index) public {
        totalWaves += 1;
        setPokemon(_address, _pokemon);
        setPokemonSprite(_address, _pokemonSprite);
        setPokemonIndex(_address, _index);
    }

    function getWaveStatus() public view returns (uint256) {
        console.log("%s has waved!", msg.sender);
        console.log("Waver's favorite pokemon is %s", getPokemon(msg.sender));
        console.log("Waver's pokemon sprite is %s", getPokemonSprite(msg.sender));
        console.log("Pokemon ID: %d", getPokemonIndex(msg.sender));
        return totalWaves;
    }
}