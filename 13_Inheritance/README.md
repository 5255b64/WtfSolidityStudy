https://github.com/AmazingAng/WTF-Solidity/tree/main/13_Inheritance
---
# 继承（Inheritance）
solidity中的contract存在继承关系，类似与面向对象编程中的类继承。
## 继承规则
 - 2个重要关键字
    - virtual：修饰父合约函数，表示该函数允许被重写。
    - override：修饰子合约函数，表示该函数将重写父合约函数。
 - note 1
    - 一个函数可以同时被virtual和override两个关键字修饰
 - note 2
    - 如果一个public的状态变量被override修饰，那么它的getter函数也会被override修饰。
    - （PS. 为什么变量能被override修饰？）
## 简单继承（Simple inheritance）
 - 语法
```solidity
contract Father is Grandfather{
    ...
}
```
## 多重继承（Multiple inheritance）
- 规则1.继承顺序-必须按照从上到下的顺序
```solidity
contract Son is Gatherfather, Father{
    ...
}
```
- 规则2.如果对个父类中存在相同函数，那么该函数必须在子类中重写。
- 规则3.当一个被重写的函数在多个父类中出现，那么必须在override关键词后标注重写的父类。
```solidity
override(Grandfather, Father)
```
## 修饰器继承（Inheritance of modifiers）
例子如下：
```solidity
contract Base1 {
    modifier exactDividedBy2And3(uint _a) virtual {
        require(_a % 2 == 0 && _a % 3 == 0);
        _;
    }
}

contract Identifier is Base1 {
    // Calculate _dividend/2 and _dividend/3, but the _dividend must be a multiple of 2 and 3
    function getExactDividedBy2And3(uint _dividend) public exactDividedBy2And3(_dividend) pure returns(uint, uint) {
        return getExactDividedBy2And3WithoutModifier(_dividend);
    }

    // Calculate _dividend/2 and _dividend/3
    function getExactDividedBy2And3WithoutModifier(uint _dividend) public pure returns(uint, uint){
        uint div2 = _dividend / 2;
        uint div3 = _dividend / 3;
        return (div2, div3);
    }
}
```
子合约可以直接使用修饰器exactDividedBy2And3，也可以按照如下方式进行重写：
```solidity
    modifier exactDividedBy2And3(uint _a) override {
        _;
        require(_a % 2 == 0 && _a % 3 == 0);
    }
```
## 构造函数继承（Inheritance of constructors）
例子如下：
```solidity
// Applying inheritance to the constructor functions
abstract contract A {
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}
```
调用父合约构造函数的2种方法：
 - 1.在构造函数后声明父合约构造函数，并写入参数。
    - 语法：contract B is A(1){}
    - 先执行父合约构造函数，再执行子合约构造函数。
 - 2.在子合约构造函数中直接调用父合约构造函数
```solidity
contract C is A {
    constructor(uint _c) A(_c * _c) {}
}
```
## 调用父合约函数
2种方法：
 - 1.使用合约名直接调用
```solidity
    function callParent() public{
        Grandfather.pop();
    }
```
 - 2.使用super关键字
    - 调用最底层的父合约
```solidity
    function callParentSuper() public{
        // call the function one level higher up in the inheritance hierarchy
        super.pop();
    }
```
## 钻石继承（Diamond inheritance）
以下案例中，调用people的super.bar()会导致，Eve.bar()和Adam.bar()均被执行，理论上会导致God.bar()被执行两次。实际上Solidity使用了DAG (directed acyclic graph)，保证God.bar()只被执行一次。
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Inheritance tree visualized：
  God
 /  \
Adam Eve
 \  /
people
*/
contract God {
    event Log(string message);
    function foo() public virtual {
        emit Log("God.foo called");
    }
    function bar() public virtual {
        emit Log("God.bar called");
    }
}
contract Adam is God {
    function foo() public virtual override {
        emit Log("Adam.foo called");
        Adam.foo();
    }
    function bar() public virtual override {
        emit Log("Adam.bar called");
        super.bar();
    }
}
contract Eve is God {
    function foo() public virtual override {
        emit Log("Eve.foo called");
        Eve.foo();
    }
    function bar() public virtual override {
        emit Log("Eve.bar called");
        super.bar();
    }
}
contract people is Adam, Eve {
    function foo() public override(Adam, Eve) {
        super.foo();
    }
    function bar() public override(Adam, Eve) {
        super.bar();
    }
}
```
