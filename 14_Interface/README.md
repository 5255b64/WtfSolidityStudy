https://github.com/AmazingAng/WTF-Solidity/blob/main/14_Interface/readme.md
---
# 抽象合约（Abstract contract）
PS. 与Java中的抽象类类似
 - 抽象合约定义：
    - 如果一个合约中至少有一个函数没有具体实现（该函数必须用virtual修饰），则该合约为抽象合约。
    - 示例：
```solidity
abstract contract InsertionSort{
    function insertionSort(uint[] memory a) public pure virtual returns(uint[] memory);
}
```
# 接口（Interface）
PS. 与java中的接口类型
 - 接口定义：
    - 所有函数都没有具体实现的合约
 - 接口规则
    - 1.不能包含状态变量
    - 2.没有构造函数
    - 3.只能继承接口合约，不能继承非接口的合约。
    - 4.所有函数都必须用external继承，并且不能有函数体。
    - 5.继承该接口的子合约必须重写它的所有函数。
 - 接口的2个重要作用：
    - 1.合约里每个函数的bytes4选择器，以及基于它们的函数签名函数名(每个参数类型）。
    - 2.接口id（更多信息见EIP165）