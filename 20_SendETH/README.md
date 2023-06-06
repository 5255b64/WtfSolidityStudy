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

