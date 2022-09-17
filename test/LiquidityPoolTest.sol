// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {LiquidityPoolWrapper} from "./testWrappers/LiquidityPoolWrapper.sol"; //@note This is a wrapper

import {USDCMock} from "./mocks/USDCMock.sol";

contract LiquidityPoolTest is Test {
    LiquidityPoolWrapper firstPool;
    LiquidityPoolWrapper secondPool;

    USDCMock usdc;

    event transfer(address _targetLP, uint256 _amount, bytes32 _transferalHash);

    event receiveCoin(uint256 _amount, bytes32 _transferalHash);

    event EqualizeToFiatFromCrypto(uint256 _idealBalance, uint256 _amount);

    event EqualizeToCryptoFromFiat(uint256 _idealBalance, uint256 _amount);

    function setUp() public {
        usdc = new USDCMock();

        firstPool = new LiquidityPoolWrapper("Euro", address(usdc));
        secondPool = new LiquidityPoolWrapper("USD", address(usdc));

        firstPool.setController(address(this));
        secondPool.setController(address(this));
    }

    
    function testTransferToLP(uint256 _funds, uint256 _amount) public {
        vm.assume(_funds<2**128);//Asserts that Uint is in relevant Area

        vm.assume(_funds >= _amount);
        vm.assume(_amount > 0);

        usdc.mintTo(address(firstPool), _funds);

        vm.expectEmit(true, true, true, true);
        emit transfer(address(secondPool), _amount, bytes32(""));

        firstPool.transferToLP(address(secondPool), _amount, bytes32(""));

        assertTrue(usdc.balanceOf(address(firstPool)) == _funds - _amount);
        assertTrue(usdc.balanceOf(address(secondPool)) == _amount);
        assertTrue(firstPool.fiatBalance() == _amount);
    }

    function testReceivedTokens(uint256 _initialFiatFunds, uint256 _amount)
        public
    {
        vm.assume(_initialFiatFunds<2**128);//Asserts that Uint is in relevant Area

        vm.assume(_initialFiatFunds >= _amount);
        vm.assume(_amount > 0);

        firstPool.setFiatBalance(_initialFiatFunds);

        vm.expectEmit(true, true, true, true);
        emit receiveCoin(_amount, bytes32(""));

        firstPool.receivedTokens(_amount, bytes32(""));

        assertTrue(firstPool.fiatBalance() == _initialFiatFunds - _amount);
    }

    function testEqualizationViaTransfer(
        uint256 _initialFiatFunds,
        uint256 _initialCryptoFunds,
        uint256 _amount
    ) public {
        vm.assume(_initialFiatFunds<2**128);//Asserts that Uint is in relevant Area
        vm.assume(_initialCryptoFunds<2**128);//Asserts that Uint is in relevant Area
        vm.assume(_initialFiatFunds >= _amount);
        vm.assume(_initialCryptoFunds >= _amount);
        vm.assume(_amount > 0);

        usdc.mintTo(address(firstPool), _initialCryptoFunds);
        firstPool.setFiatBalance(_initialFiatFunds);

        bool exceedEqualizedAmount = (_amount *
            (firstPool.re_equalizeAmount() + 100)) /
            100 >=
            (_initialFiatFunds + _amount);
        if (exceedEqualizedAmount) {
            vm.expectEmit(true, true, true, true);
            emit transfer(address(secondPool), _amount, bytes32(""));
        }
        
        firstPool.transferToLP(address(secondPool), _amount, bytes32(""));

        if(exceedEqualizedAmount){
            assertTrue(usdc.balanceOf(address(firstPool))== firstPool.fiatBalance());
        }
    }
}
