// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Quiz2{
    // add something here
    bool public _bool = true;
    string public _string = "_string:123";
    bytes32 public _byte32 = "_byte32:123";
    bytes1 public _byte1 = _byte32[0]; 
    // bytes1 public _byte8 = _byte32[0]; 
    address public _address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    enum EnumSet { Enum1, Enum2, Enum3 }
    EnumSet public action1 = EnumSet.Enum1;
    EnumSet public action2 = EnumSet.Enum2;

    function enum1ToUint() external view returns(uint){
        return uint(action1);
    }
    function enum2ToUint() external view returns(uint){
        return uint(action2);
    }
}
