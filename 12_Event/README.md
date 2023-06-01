https://github.com/AmazingAng/WTF-Solidity/blob/main/12_Event/Event.sol
---
# 事件event
 - 事件event是对EVM日志中的txs的抽象
 - event的2个特点：
    - 响应：
        - 应用程序（ether.js）可以通过RPC接口订阅和监听这些事件，并在前端做响应。
    - 环保：使用event可以省gas
        - 一个event花费2000gas
        - 如果改用一个on-chain的变量，需要花费20000gas
 - PS：event似乎主要用于日志记录
## event声明
 - 以下例子是ERC20的Transfer事件
```solidity
event Transfer(address indexed from, address indexed to, uint256 value);
```
## 触发event
 - 在函数中主动触发event，生成日志记录。
```solidity
    // define _transfer function，execute transfer logic
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) external {

        _balances[from] = 10000000; // give some initial tokens to transfer address

        _balances[from] -=  amount; // "from" address minus the number of transfer
        _balances[to] += amount; // "to" address adds the number of transfer

        // emit event
        emit Transfer(from, to, amount);
    }
```
