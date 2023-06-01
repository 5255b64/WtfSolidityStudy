- https://github.com/AmazingAng/WTF-Solidity/tree/main/03_Function
---
# Function
函数格式
> function <function name>(<parameter types>) [internal|external] [pure|view|payable] [returns (<return types>)]

 - 函数可见性标识符（Function visibility specifiers）
    - 4类：[internal|external|public|private]
        - public
            - 合约内外均可见
        - private
            - 智能合约内可见
            - 继承的合约不可见
        - external：
            - 能被外部合约调用，合约本身不能直接调用。
            - 合约本身能通过this.f()调用，其中f是函数名。
        - internal：
            - 能被合约本身调用，外部合约不可调用。
            - 继承的合约可调用。
    - 默认可见性
        - function默认为public
        - variables默认为internal
    - [internal|public|private]可用于修饰变量，并且public的变量会默认生成getter函数。
 - 函数功能关键字[pure|view|payable]
    - payable
        - 表明用户可以通过该函数向合约转账
    - [pure|view]
        - 这两个关键字与gas相关，调用声明为[pure|view]的函数不需要支付gas费用。
        - pure
            - 无法读写变量
        - view
            - 可读不可写
        - default
            - 可读可写
 - 
