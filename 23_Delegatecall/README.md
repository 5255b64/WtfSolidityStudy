https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/23_Delegatecall_en/readme.md
---
# delegatecall
 - 与call()的用法类似，区别在于使用的状态变量。
 - 举例如下：用户A调用合约B的函数，而合约B调用合约C的函数。
     - 如果B使用call()来调用合约C的函数，那么使用的是合约C的状态变量。
     - 如果B使用delegatecall()来调用合约C的函数，那么使用的是合约B的状态变量。
         - 合约B必须和目标合约C的变量存储布局必须相同，变量的类型、名称、声明顺序均相同。（若顺序不同，执行不会出错，但是执行结果大概率存在问题。）
     - delegatecall只使用了目标合约的逻辑，而不使用它的状态变量。
 - 使用场景：
     - 代理合约（Proxy Contract）：代理合约不包含具体业务逻辑，只用作用户接口，而具体业务逻辑存储在逻辑合约（logic contract），代理合约通过delegatecall来调用逻辑合约。当合约升级时，仅需调整逻辑合约，无需调整代理合约。
     - EIP-2535（Todo）
 - 和call不一样，delegatecall在调用合约时可以指定交易发送的gas，但不能指定发送的ETH数额