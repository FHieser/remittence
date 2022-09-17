// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {LiquidityPool} from "../src/LiquidityPool.sol";
import {RemittanceController} from "../src/RemittanceController.sol";

import {USDCMock} from "./mocks/USDCMock.sol";

contract RemittanceControllerTest is Test {
    LiquidityPool euroPool;
    LiquidityPool usdPool;
    RemittanceController controller;

    USDCMock usdc;

    event transfer(address _targetLP, uint256 _amount, bytes32 _transferalHash);

    event receiveCoin(uint256 _amount, bytes32 _transferalHash);

    function setUp() public {
        usdc = new USDCMock();

        euroPool = new LiquidityPool("Euro", address(usdc));
        usdPool = new LiquidityPool("USD", address(usdc));

        controller = new RemittanceController(
            address(usdPool),
            address(euroPool)
        );

        euroPool.setController(address(controller));
        usdPool.setController(address(controller));
    }

    function test() public {
        
    }
}
