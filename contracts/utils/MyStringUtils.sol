// SPDX-License-Identifier: MIT
// author: @GentleXu
pragma solidity ^0.8;
library MyStringUtils{
    function strcat(string memory str1, string memory str2) public pure returns(string memory) {
        bytes memory s1 = bytes(str1);
        bytes memory s2 = bytes(str2);
        bytes memory res = new bytes(s1.length + s2.length);
        for(uint i=0; i<s1.length; i++){
            res[i] = s1[i];
        }
        for(uint i=0; i<s2.length; i++){
            res[s1.length + i] = s2[i];
        }
        return string(res);
    }
    function substring(string memory str, uint startInd, uint endInd) public pure returns(string memory){
        bytes memory strBytes = bytes(str);
        bytes memory endStr = new bytes(endInd - startInd);
        for(uint i=startInd; i<endInd; i++){
            endStr[i-startInd] = strBytes[i];
        }
        return string(endStr);
    }
}