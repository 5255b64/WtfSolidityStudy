https://github.com/AmazingAng/WTF-Solidity/blob/main/05_DataStorage/DataStorage.sol
---
## 数据存储位置（data location）
 - 使用引用类型变量时，数据存储有特殊规则。
 - 3类引用变量
    - array, struct and mapping
 - 3类数据存储位置
    - storage
    - memory
    - calldata
### storage
 - 存储在链上（类比于PC的磁盘）
 - 消耗gas多
 - 存储状态变量（state variables）
### memory
 - 存储在内存
 - 消耗gas少
 - 存储函数的临时变量（temporary variables）和参数（parameters）
### calldata
 - 存储在内存
 - 消耗gas少
 - 与memory类似，区别在于calldata的数据不可修改（只读）。
```solidity
    function fCalldata(uint[] calldata _x) public pure returns(uint[] calldata){
        //The parameter is the calldata array, which cannot be modified.
        // _x[0] = 0 //This modification will report an error.
        return(_x);
    }
```
## 数据存储与赋值
 - 函数内部声明引用时，可以显式声明data location
 - 当把storage引用赋值给另一个storage引用时，只创建引用（浅拷贝）。
```solidity
    uint[] x = [1,2,3]; // state variable: array x

    function fStorage() public{
        //Declare a storage variable xStorage, pointing to x. Modifying xStorage will also affect x
        uint[] storage xStorage = x;
        xStorage[0] = 100;
    }
```
 - 当把storage引用赋值给另一个memory引用时，会复制数据，从链上复制到内存（深拷贝）。
    - 以下案例中，对临时引用变量xMemory的修改不会影响状态引用变量x。
```solidity
    uint[] x = [1,2,3]; // state variable: array x
    
    function fMemory() public view{
        //Declare a variable xMemory of Memory, copy x. Modifying xMemory will not affect x
        uint[] memory xMemory = x;
        xMemory[0] = 100;
    }
```
 - 当把memory引用赋值给另一个memory引用时，只创建引用（浅拷贝）。
 - 除此之外的任何对storage引用的修改（memory赋值给storage），都会产生新的数据。
## 变量的作用域(Variable scope)
- Solidity中的变量作用域有三种
    - 状态变量（state variables）
    - 局部变量（local variables）
    - 全局变量（global variables）
### 状态变量（state variables）
 - 存储在链上（storage）
 - gas费用高
 - 合约内的函数可以直接调用OR修改
 - 声明位置在合约内&函数外
 - （类似java的类变量）
### 局部变量（local variables）
 - 存储在内存（memory）
 - gas费用低
 - 仅在函数执行期间生效，函数执行结束后失效。
 - 声明位置在函数内
### 全局变量（global variables）
 - 由solidity定义
 - 任何地方均可调用
```solidity
    function global() external view returns(address, uint, bytes memory){
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        return(sender, blockNum, data);
    }
```
 - 常用的全局变量
```
blockhash(uint blockNumber): (bytes32) The hash of the given block - only applies to the 256 most recent block.
block.coinbase : (address payable) The address of the current block miner
block.gaslimit : (uint) The gaslimit of the current block
block.number : (uint) Current block number
block.timestamp : (uint) The timestamp of the current block, in seconds since the unix epoch
gasleft() : (uint256) Remaining gas
msg.data : (bytes calldata) Complete calldata
msg.sender : (address payable) Message sender (current caller)
msg.sig : (bytes4) first four bytes of the calldata (i.e. function identifier)
msg.value : (bytes4) number of wei sent with the message
```
