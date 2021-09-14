// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0;

contract Overflow{
    
    // Se Overlfow zero
    function overFlow() public view returns(uint8){
        uint8 big = 255 + uint8(100);
        return big;
    }
}
