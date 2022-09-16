// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {LiquidityPool} from "./LiquidityPool.sol";

contract RemittanceController {
    address usdPool;
    address euroPool;

    constructor(address _usdPool, address _euroPool) {
        usdPool = _usdPool;
        euroPool = _euroPool;
    }

    function triggerTransferUSDtoEuro(uint256 _amount, bytes32 _transferalHash)
        public
    {
        //@todo add AccessControl
        //@todo add Security Checks
        LiquidityPool(usdPool).transferToLP(euroPool, _amount, _transferalHash);
        LiquidityPool(usdPool).receivedTokens(_amount, _transferalHash);
    }

    function triggerTransferEurotoUSD(uint256 _amount, bytes32 _transferalHash)
        public
    {
        //@todo add AccessControl
        //@todo add Security Checks
        LiquidityPool(euroPool).transferToLP(usdPool, _amount, _transferalHash);
        LiquidityPool(euroPool).receivedTokens(_amount, _transferalHash);
    }
}
