// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
contract Test{
    constructor() payable {}
    function getBalance() view public returns (uint balance) {
        return address(this).balance;
    }
    function transferETH(address payable _to, uint256 amount) external payable{
        _to.transfer(amount);
    }
    
    event Log(string data);
    function getETH(string memory data) external payable {
        
        emit Log(data);
    }


    // 定义事件
    event Received(address Sender, uint Value, bytes Data);
    // 接收ETH时释放Received事件
    receive() external payable {

    }
    fallback() external payable {
        emit Received(msg.sender, msg.value, msg.data);
    }
}