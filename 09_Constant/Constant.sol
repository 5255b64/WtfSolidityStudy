// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Constant {
    // constant变量必须在声明的时候初始化，之后不能改变
    uint256 public constant CONSTANT_NUM = 10;
    string public constant CONSTANT_STRING = "0xAA";
    bytes public constant CONSTANT_BYTES = "WTF";
    address public constant CONSTANT_ADDRESS = 0x0000000000000000000000000000000000000000;

    // immutable变量可以在constructor里初始化，之后不能改变
    uint256 public immutable IMMUTABLE_NUM = 9999999999;
    address public immutable IMMUTABLE_ADDRESS;
    uint256 public immutable IMMUTABLE_BLOCK;
    uint256 public immutable IMMUTABLE_TEST;

    // 利用constructor初始化immutable变量，因此可以利用
    constructor(){
        IMMUTABLE_ADDRESS = address(this);
        IMMUTABLE_BLOCK = block.number;
        IMMUTABLE_TEST = test();
        // 以下代码会编译出错 Immutable state variable already initialized.(1574)
        // IMMUTABLE_NUM = 9999999999;
    }

    function test() public pure returns(uint256){
        uint256 what = 9;
        return(what);
    }

    // 以下代码会编译出错 TypeError: Cannot assign to a constant variable.
    // function tryToChange() public{
    //     CONSTANT_NUM = 777;
    //     CONSTANT_STRING = "0x11";
    //     CONSTANT_BYTES = "WTF11";
    //     CONSTANT_ADDRESS = 0x222;
    // }
}