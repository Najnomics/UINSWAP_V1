// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Token is ERC20 {

    contructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
    }
}