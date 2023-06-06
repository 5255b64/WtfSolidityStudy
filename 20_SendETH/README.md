https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/20_SendETH_en/readme.md
---
# 发送ETH转账
三种转账方式：
 1. transfer()
 2. send()
 3. call()
推荐使用call()方式
## 接受ETH转账的合约

```solidity
contract ReceiveETH {
    // Receiving ETH event, log the amount and gas
    event Log(uint amount,  uint gas);
    
    // receive() is executed when receiving ETH
    receive() external payable{
        emit Log(msg.value,  gasleft());
    }
    
    // return the balance of the contract
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
}
```

## 发送ETH转账的合约
 - 将构造函数声明为payable，可以在部署合约时向外转账。
```solidity
contract SendETH {
    // constructor, make it payable so we can transfer ETH at deployment
    constructor() payable{}
    // receive() function, called when receiving ETH
    receive() external payable{}
}
```
 - 转账函数特征如下：

| 函数 | 使用方式 | gas limit | 执行失败时是否回滚 | 返回值 |
| --- | --- | --- | --- | --- |
| transfer() | 2300 | receiverAddress.transfer(value in Wei) | 是 | 无 |
| send() | 2300 | receiverAddress.send(value in Wei) | 否 | bool |
| call() | 无 | receiverAddress.call{value: value in Wei}("") | 否 | (bool,  data) |

 - 对于transfer()和send()，2300的gas limit足够进行一次转账，但是如果接受ETH的合约的fallback()或者receive()中存在复杂逻辑，可能会导致gas过高，转账失败。

 - 注意：调用SendETH中的方法转账方法时，需要在调用时向SendETH转账，如果SendETH的余额不足，会导致transfer()、send()、call()失败；
 - 如果transfer()、send()、call()失败，需要通过回滚才能将转入SendETH的ETH返还给调用的用户。

 - transfer() demo:
     - 向 _to 地址转账 amount 个wei。
```solidity
// sending ETH with transfer()
function transferETH(address payable _to,  uint256 amount) external payable{
	_to.transfer(amount);
}
```

 - send() demo:
```solidity
// sending ETH with send()
function sendETH(address payable _to,  uint256 amount) external payable{
    // check result of send()，revert with error when failed
    bool success = _to.send(amount);
    if(!success){
    	revert SendFailed();
    }
}
```

 - call() demo:
```solidity
// sending ETH with call()
function callETH(address payable _to,  uint256 amount) external payable{
    // check result of call()，revert with error when failed
    (bool success, ) = _to.call{value: amount}("");
    if(!success){
    	revert CallFailed();
    }
}
```

## 总结
In this tutorial, we talked about three ways of sending ETH in solidity: transfer, send and call.

There is no gas limit for call, which is the most flexible and recommended way;
The gas limit of transfer is 2300 gas, transaction will be reverted if it fails, which makes it the second choice;
The gas limit of send is 2300, transaction will not be reverted if it fails, which makes it the worst choice.