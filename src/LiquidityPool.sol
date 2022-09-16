// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract LiquidityPool {
    string name;
    uint256 fiatPool;
    address usdc;
    address remittanceController;

    constructor(
        string memory _name,
        address _usdc,
        address _remittanceController
    ) {
        name = _name;
        usdc = _usdc;
        remittanceController = _remittanceController;
    }

    function transferToLP(
        address _targetLP,
        uint256 _amount,
        bytes32 _transferalHash
    ) public {
        //@todo add AccessControl
        //@todo add Security Checks
        //@todo add event with hash

        //Update the Current Fiat Equivalent, that should be in the Fiat-Pool
        fiatPool += _amount;

        //@todo add transfer
        
    }

    function receivedTokens(uint256 _amount, bytes32 _transferalHash) public {
        //@todo add AccessControl
        //@todo add Security Checks

        //Update the Current Fiat Equivalent, that should be in the Fiat-Pool
        fiatPool -= _amount;

        //@todo add event with hash
    }

    //@todo Add Equilization
}
