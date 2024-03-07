// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./utils/MyStringUtils.sol";
contract Gym is ERC20{
    constructor() public ERC20(Strings.toHexString(uint256(uint160(address(this))), 20),MyStringUtils.strcat("KFG-", MyStringUtils.substring(Strings.toHexString(uint256(uint160(address(this))), 20),2,9))){}
    function _mintToken() public{
        _mint(msg.sender, 10 * 1000000000000000000);
    }
}