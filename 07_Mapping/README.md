https://github.com/AmazingAng/WTF-Solidity/blob/main/07_Mapping/Mapping.sol
---
## Mapping语法
 - map的使用方式：mapping(_KeyType => _ValueType)
```solidity
    mapping(uint => address) public idToAddress; // id maps to address
    mapping(address => address) public swapPair; // mapping of token pairs, from address to address
```
## Mapping规则
 - 规则1
    - _KeyType只能使用solidity内置类型，不能使用结构体struct。
    - _ValueType可以是任何类型。
 - 规则2
    - mapping的存储位置是storage
    - mapping不能作为函数的参数或者返回值
 - 规则3
    - 如果mapping使用public修饰，那么solidity会默认生成一个getter函数。
 - 规则4
    - mapping插入语法：_Var[_Key] = _Value
```solidity
    function writeMap (uint _Key, address _Value) public {
        idToAddress[_Key] = _Value;
      }
```
## Mapping原则
 - 原则1
    - 无法获取mapping的key和length信息
 - 原则2
    - mapping使用keccak256(key)作为hash方法
 - 原则3
    - mapping中value的默认值为0