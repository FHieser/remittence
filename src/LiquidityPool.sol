// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract LiquidityPool {
    string public name;
    uint256 public fiatPool;
    address public usdc;
    address public remittanceController;

    event transfer(address _targetLP, uint256 _amount, bytes32 _transferalHash);

    event receiveCoin(uint256 _amount, bytes32 _transferalHash);

    constructor(string memory _name, address _usdc) {
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

        //Update the Current Fiat Equivalent, that should be in the Fiat-Pool
        fiatPool += _amount;

        IERC20(usdc).transfer(_targetLP, _amount);

        emit transfer(_targetLP, _amount, _transferalHash);
    }

    function receivedTokens(uint256 _amount, bytes32 _transferalHash) public {
        //@todo add AccessControl
        //@todo add Security Checks

        //Update the Current Fiat Equivalent, that should be in the Fiat-Pool
        fiatPool -= _amount;

        emit receiveCoin(_amount, _transferalHash);
    }

    //@todo Add Equalization

    function setController(address _controller) public {
        //@todo add AccessControl
        //@todo add Security Checks
        remittanceController = _controller;
    }
}
