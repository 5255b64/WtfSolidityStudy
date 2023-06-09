// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

interface IOtherContract {
    function getBalance() external returns(uint);
    function setX(uint256 x) external payable;
    function getX() external view returns(uint x);
}

contract OtherContract is IOtherContract{
    uint256 private _x = 0;
    event Log(uint amount, uint gas);
    
    function getBalance() external view override returns(uint) {
        return address(this).balance;
    }

    function setX(uint256 x) external override payable{
        _x = x;
        if(msg.value > 0){
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view override returns(uint x){
        x = _x;
    }
}


contract CallOtherContract{
    function callGetBalance(address _address) external returns(uint) {
        IOtherContract oc = IOtherContract(_address);
        return oc.getBalance();
    }

    function callSetX(address _address, uint256 x) external payable{
        IOtherContract oc = IOtherContract(_address);
        oc.setX(x);
    }

    function callGetX(address _address) external view returns(uint x){
        IOtherContract oc = IOtherContract(_address);
        x = oc.getX();
    }
}

contract MyContract {
    OtherContract other;
    constructor(address _address){
        other = OtherContract(_address);
    }

    function call_getX() external view returns(uint x){
        x = other.getX();
    }
    function call_setX(uint256 x) external{
        other.setX(x);
    }
}