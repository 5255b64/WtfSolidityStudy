https://github.com/AmazingAng/WTF-Solidity/tree/main/04_Return
---
## return语法
 - returns
    - 用于声明返回值数量和类型
    - 用于函数声明部分的函数名之后
 - return
    - 用于传递返回值
    - 用于函数体末尾
```solidity
    // returning multiple variables
    function returnMultiple() public pure returns(uint256, bool, uint256[3] memory){
            return(1, true, [uint256(1),2,5]);
        }
```
## returns中声明返回变量名称
```solidity
    // named returns
    function returnNamed() public pure returns(uint256 _number, bool _bool, uint256[3] memory _array){
        _number = 2;
        _bool = false; 
        _array = [uint256(3),2,1];
    }
```
 - 当returns中显式声明变量名称时 可以不在函数体中使用return 只需给对应变量赋值
## 解构式赋值（Destructuring assignments）
PS. 不知道有什么用
```solidity
    function readReturn() public pure{
        // 读取全部返回值
        uint256 _number;
        bool _bool;
        bool _bool2;
        uint256[3] memory _array;
        (_number, _bool, _array) = returnNamed();
        
        // 读取部分返回值，解构式赋值
        (, _bool2, ) = returnNamed();
    }
```
以上代码未对返回值赋值，在remix中无法读取返回参数。

