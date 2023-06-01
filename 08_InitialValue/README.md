https://github.com/AmazingAng/WTF-Solidity/blob/main/08_InitialValue/InitialValue.sol
---
## value type的初始值
初始值全为0
```
boolean: false
string: ""
int: 0
uint: 0
enum: first element in enumeration
address: 0x0000000000000000000000000000000000000000 (or address(0))
function
internal: blank function
external: blank function
```
## reference type的初始值
 - mapping
    - 所有成员value均为对应类型的初始值
 - struct
    - 所有成员value均为对应类型的初始值
 - 数组
    - 动态数组
        - 空数组[]
    - 静态数组
        - 所有成员value均为对应类型的初始值
## delete 运算符（关键字）
 - delete会给变量赋初始值
```solidity
    // delete operator
    bool public _bool2 = true; 
    function d() external {
        delete _bool2; // delete will make _bool2 change to default(false)
    }
```
