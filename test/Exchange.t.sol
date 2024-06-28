// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/YourToken.sol";  // Import your ERC20 token contract
import "../src/YourExchange.sol";  // Import your exchange contract

contract LiquidityTest is Test {
    YourToken token;
    YourExchange exchange;
    address owner;

    function setUp() public {
        owner = address(this);
        token = new YourToken("Test Token", "TTK");
        exchange = new YourExchange(address(token));

        // Mint some tokens for the owner
        token.mint(owner, 1000 ether);

        // Approve the exchange to spend the owner's tokens
        token.approve(address(exchange), 200 ether);
    }

    function testAddLiquidity() public {
        uint256 tokenAmount = 200 ether;
        uint256 ethAmount = 100 ether;

        // Add liquidity to the exchange
        exchange.addLiquidity(tokenAmount, {value: ethAmount});

        // Check the ETH balance of the exchange
        assertEq(address(exchange).balance, ethAmount);

        // Check the token reserve in the exchange
        assertEq(exchange.getReserve(), tokenAmount);
    }
}
