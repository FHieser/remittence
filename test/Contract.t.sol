// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {LiquidityPool} from "../src/LiquidityPool.sol";
import {RemittanceController} from "../src/RemittanceController.sol";

contract ContractTest is Test {
    LiquidityPool euroPool;
    LiquidityPool usdPool;
    RemittanceController controller;

    function setUp() public {
        euroPool = new LiquidityPool("Euro", address(0x0));
        usdPool = new LiquidityPool("USD", address(0x0));
        
        controller = new RemittanceController(
            address(usdPool),
            address(euroPool)
        );

        euroPool.setController(controller);
        usdPool.setController(controller);
    }

    function testExample() public {
        assertTrue(true);
    }
}
