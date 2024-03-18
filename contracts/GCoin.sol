// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
contract GCoin is ERC20{
    // 兑换的倍率
    // 若GCoin/Yuan = 1.2:1, 则rate_x10 = 12
    uint rate_x10;
    constructor(uint _rate_x10) ERC20("GCoin", "GCoin") payable {
        rate_x10 = _rate_x10;
    }
    //Customers pay Yuan and get GCoin
    function _exchangeGCoin() external payable returns (bool success){
        uint val = (msg.value*rate_x10)/10;
        uint256 _before = balanceOf(msg.sender);
        _mint(msg.sender, val);
        uint256 _after = balanceOf(msg.sender);
        if((_after - _before) != val){
            revert("Mint Failed");
        }else{
            return true;
        }
    }
    function _exchangeYuan(uint amount) external{
        _burn(msg.sender, amount);
        payable(msg.sender).transfer((amount* 10)/rate_x10);
    }
    function getContractBalance() public view returns (uint balance){
        return address(this).balance;
    }
    
}