// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {LiquidityPool} from "../../src/LiquidityPool.sol";

contract LiquidityPoolWrapper is LiquidityPool {
    constructor(string memory _name, address _usdc)
        LiquidityPool(_name, _usdc)
    {}

    function setFiatBalance(uint256 _amount) public {
        fiatBalance = _amount;
    }
}
