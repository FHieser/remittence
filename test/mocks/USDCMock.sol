// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract USDCMock is ERC20 {
    constructor() ERC20("USDCMock", "USDC") {}

    function mintTo(address _to,uint _amount) public {
        _mint(_to, _amount);
    }

    function burnFrom(address _from,uint _amount) public {
        _burn(_from, _amount);
    }
}
