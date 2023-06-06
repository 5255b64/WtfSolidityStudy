https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/19_Fallback_en/readme.md
---
# 接受ETH转账&回滚
Solidity支持两种特殊的回调函数，receive()和fallback()，他们主要在两种情况下被使用：
 1. 接收ETH
 2. 处理合约中不存在的函数调用（代理合约proxy contract）
注意⚠️：在solidity 0.6.x版本之前，语法上只有 fallback() 函数，用来接收用户发送的ETH时调用以及在被调用函数签名没有匹配到时，来调用。 0.6版本之后，solidity才将 fallback() 函数拆分成 receive() 和 fallback() 两个函数。
## receive()函数
 - receive()函数较为特殊：
    - 每个合约至多有一个receive()函数
    - 不需使用funciton关键字
    - 必须使用external和payable关键字
 - 例子：
```solidity
    // Declare event
    event Received(address Sender,  uint Value); 
    // Emit Received event
    receive() external payable {
        emit Received(msg.sender,  msg.value); 
    }
```
## fallback()函数
 - 何时会调用fallback()函数？
    - 当调用合约中不存在的函数时。
    - if none of the other functions match the given function signature, or if no data was supplied at all and there is no receive Ether function.
 - 作用
    - 可用于接收ETH，也可以用于代理合约proxy contract
 - 调用方式：
    - 每个合约至多有一个fallback()函数
    - 不需使用funciton关键字
    - 必须使用external关键字
    - 可以使用payable关键字（用于接受ETH转账的情况下）
```solidity
    event fallbackCalled(address Sender,  uint Value,  bytes Data); 

    // fallback
    fallback() external payable{
        emit fallbackCalled(msg.sender,  msg.value,  msg.data); 
    }
```
## receive()与fallback()的区别
receive()与fallback()都能用于接受ETH，在该场景下的区别如下：
```
Execute fallback() or receive()?
         Receive ETH
              |
      msg.data is empty?
            /  \
          Yes   No
          /      \
Has receive()?   fallback()
        / \
      Yes  No
      /     \
receive()   fallback()
```