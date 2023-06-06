https://github.com/AmazingAng/WTF-Solidity/blob/main/16_Overloading/Overloading.sol
---
# 重载Overloading
 - 重载定义：
    - Functions with the same name but different input parameter types can exist at the same time, and they are regarded as different functions.
 - 注意：solidity中的修饰器（modifier）无法重载
## 函数重载
 - 略
## 参数匹配：Argument Matching
 - 以下例子的重载函数，当调用f(50)时会抛出error：
```solidity
    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }
```
 - 原因是50即可以被转换为uint8，也可以转化为uint256。