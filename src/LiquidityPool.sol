// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract LiquidityPool {
    string public name;
    uint256 public fiatPool;
    address public usdc;
    address public remittanceController;

    constructor(
        string memory _name,
        address _usdc
    ) {
        name = _name;
        usdc = _usdc;
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

    function setController(address _controller) public {
        //@todo add AccessControl
        //@todo add Security Checks
        remittanceController = _controller;
    }
}
