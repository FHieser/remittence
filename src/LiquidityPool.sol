// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "forge-std/console.sol";

contract LiquidityPool {
    string public name;
    //This assumes the fiat Balance in an USD Amount
    uint256 public fiatBalance;

    address public usdc;

    address public equalizer;
    address public remittanceController;

    uint256 public re_equalizeAmount = 20; //In %

    //--------------------------------------------------------------------------

    event transfer(address _targetLP, uint256 _amount, bytes32 _transferalHash);

    event receiveCoin(uint256 _amount, bytes32 _transferalHash);

    event EqualizeToFiatFromCrypto(uint256 _idealBalance, uint256 _amount);

    event EqualizeToCryptoFromFiat(uint256 _idealBalance, uint256 _amount);

    //--------------------------------------------------------------------------

    modifier potentialEuqalization() {
        _;
        uint256 cryptoBalance = IERC20(usdc).balanceOf(address(this));
        uint256 _idealBalance = idealBalance(cryptoBalance, fiatBalance); //@note this can be optimised by for ex or import markets by shifting the right balance to the right or left
        uint256 absDifference = abs(
            int256(_idealBalance) - int256(cryptoBalance) //@note this assumes you can cast uint256 to int256
        );
        if (absDifference != 0) {
            uint256 differencePortion = (_idealBalance * 100) / absDifference;
            if (differencePortion >= re_equalizeAmount) {
                equalize(cryptoBalance, fiatBalance, _idealBalance);
            }
        }
    }

    //--------------------------------------------------------------------------

    constructor(string memory _name, address _usdc) {
        name = _name;
        usdc = _usdc;
    }

    //--------------------------------------------------------------------------

    function transferToLP(
        address _targetLP,
        uint256 _amount,
        bytes32 _transferalHash
    ) public potentialEuqalization {
        //@todo add AccessControl
        //@todo add Security Checks

        //Update the Current Fiat Equivalent, that should be in the Fiat-Pool
        fiatBalance += _amount;

        IERC20(usdc).transfer(_targetLP, _amount);

        emit transfer(_targetLP, _amount, _transferalHash);
    }

    function receivedTokens(uint256 _amount, bytes32 _transferalHash)
        public
        potentialEuqalization
    {
        //@todo add AccessControl
        //@todo add Security Checks

        //Update the Current Fiat Equivalent, that should be in the Fiat-Pool
        fiatBalance -= _amount;

        emit receiveCoin(_amount, _transferalHash);
    }

    function equalize(
        uint256 cryptoBalance,
        uint256 fiatBalance,
        uint256 idealBalance
    ) private {
        int256 equalizeAmountForCrypto = int256(idealBalance) -
            int256(cryptoBalance);

        if (equalizeAmountForCrypto > 0) {
            emit EqualizeToCryptoFromFiat(
                idealBalance,
                uint256(equalizeAmountForCrypto)
            );
            fiatBalance = idealBalance;
            //@todo Trigger Payment to Crypto from Fiat
        }
        if (equalizeAmountForCrypto < 0) {
            emit EqualizeToCryptoFromFiat(
                idealBalance,
                idealBalance - fiatBalance
            );
            fiatBalance = idealBalance;
            //@todo Trigger Payment to Fiat from Crypto
        }
    }

    function idealBalance(uint256 cryptoBalance, uint256 fiatBalance)
        public
        pure
        returns (uint256 _balance)
    {
        return (cryptoBalance + fiatBalance) / 2; //@note this can be optimised by for ex or import markets by shifting the right balance to the right or left
    }

    //--------------------------------------------------------------------------

    function setController(address _controller) public {
        //@todo add AccessControl
        //@todo add Security Checks
        remittanceController = _controller;
    }

    //--------------------------------------------------------------------------

    function abs(int256 x) private pure returns (uint256) {
        return x >= 0 ? uint256(x) : uint256(-x);
    }
}
