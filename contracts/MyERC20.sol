// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "contracts/utils/MyStringUtils.sol";

// abstract contract MyERC20 is ERC20{
contract MyERC20{
    // function toYuan(uint amount) internal pure returns (string memory yuan_str){
    //     bytes memory amount_byte = bytes(Strings.toString(amount));
    //     for(uint i=0; i<)
    // }
    function convertToSmallerUnit(uint number) public pure returns (string memory) {
        uint decimal = 18;
        bytes memory entireNumber = abi.encode(number);
        // 得到前面部分
        uint dividedNumber = number / 10**18; 
        string memory convertedNumber = Strings.toString(dividedNumber); 

        // 得到后18位
        bytes memory lastNumber = new bytes(decimal);
        uint len = getUintLength(number);
        uint j=1;
        for(uint i=decimal-1; i>0; i--){
            if(len-j>=0){
                bytes1 c = entireNumber[len-j];
                lastNumber[i] = c;
            }else{
                lastNumber[i] = '0';
            }
            j++;
        }
        return string(abi.encodePacked(abi.encodePacked(convertedNumber, "."), lastNumber)); 
    }
    function getUintLength(uint number) public pure returns (uint) {
        uint length;
        while (number != 0) {
            length++;
            number /= 10;
        }
        return length;
    }
}