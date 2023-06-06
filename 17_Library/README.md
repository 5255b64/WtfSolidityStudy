https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/17_Library_en/Library.sol
---
# 库合约Library
 - 库合约是一种特殊的合约
 - 库合约的目的是提升solidity代码的复用性和减少gas
 - 库合约一般都是一些好用的函数合集（库函数）
 - 库合约与一般合约的区别：
    1. 不能存在状态变量
    2. 不能够继承或被继承
    3. 不能接收以太币
    4. 不可以被销毁
 - 创建库合约时用关键字library声明（用法与一般合约的contract关键字相同）
## 如何使用库合约
 1. 使用using for关键字：using A for B
    - A为库名
    - B为特定类型
    - 所有B类型的变量均可使用A库中的函数
```solidity
    // Using the library with the "using for" 
    using Strings for uint256;
    function getString1(uint256 _number) public pure returns(string memory){
        // Library functions are automatically added as members of uint256 variables
        return _number.toHexString();
    }
```
 2. 直接使用 库名.函数名() 进行调用
```solidity
    // Called directly by the library contract name
    function getString2(uint256 _number) public pure returns(string memory){
        return Strings.toHexString(_number);
    }
```