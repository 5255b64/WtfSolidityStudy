 - https://github.com/AmazingAng/WTF-Solidity/tree/main/02_ValueTypes
---
# 数据类型
## 数值（Value Type）
- boolean
- integer
    - int
    - uint
    - uint256
- addresses
    - address:普通地址，20字节。
    - address payable:可转账地址，包含address以及额外的成员transfer()和balance。
```solidity
    // Address
    address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    address payable public _address1 = payable(_address); // payable address (can transfer fund and check balance)
    // Members of address
    uint256 public balance = _address1.balance; // balance of address
```

- 固定长度数组（Fixed-length byte arrays）
    - 声明后无法改变数组长度，最大长度32字节。
    - 类型有：byte, bytes8, bytes32
```solidity
    // Fixed-size byte arrays
    bytes32 public _byte32 = "MiniSolidity"; 
    bytes1 public _byte = _byte32[0]; 
```
>In the above code, we assigned value MiniSolidity to the variable _byte32, or in hexadecimal: 0x4d696e69536f6c69646974790000000000000000000000000000000000000000
>
>And _byte takes the value of the first byte of _byte32, which is 0x4d.

- 枚举 - Enumeration (enum) 
    - 实际存储类型为uint
    - 用于给变量分配名称，便于阅读。
    - 比较冷门，较少使用。
```solidity
    // Let uint 0,  1,  2 represent Buy, Hold, Sell
    enum ActionSet { Buy, Hold, Sell }
    // Create an enum variable called action
    ActionSet action = ActionSet.Buy;
```
使用uint表示如下：
```solidity
    // Enum can be converted into uint
    function enumToUint() external view returns(uint){
        return uint(action);
    }
```


## 引用（Reference Type）
- 可变长数组（可变长数组）
    - 声明后可改变数组长度
    - 类型有：bytes
- 结构体（Mapping Type）
## Mapping Type
- 哈希表（hash tables）