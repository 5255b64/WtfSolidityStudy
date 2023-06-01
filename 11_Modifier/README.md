https://github.com/AmazingAng/WTF-Solidity/blob/main/11_Modifier/Owner.sol
---
## 构造函数
 - 执行时间：合约部署时
 - 常用写法：关键字constructor
```solidity
   address owner; // define owner variable

   // constructor
   constructor() {
      owner = msg.sender; //  set owner to the deployer address
   }
```
 - 旧版本写法（不建议使用）：使用合约名称作为构造函数名称（注意大小写）
```solidity
pragma solidity = 0.4.21;
contract Parents {
    // The function with the same name as the contract name(Parents) is constructor
    function Parents () public {
    }
}
```
## 修饰器modifier
 - 类似与面向对象语言中的decorator
 - 用于声明函数拥有的特性，并减少代码冗余。（which is used to declare dedicated properties of functions and reduce code redundancy.）
 - 例子1-只有owner能执行
```solidity
   // define modifier
   modifier onlyOwner {
      require(msg.sender == owner); // check whether caller is address of owner
      _; // execute the function body
   }
```
 - 例子2-只用owner才可以change owner
```solidity
   function changeOwner(address _newOwner) external onlyOwner{
      owner = _newOwner; // only owner address can run this function and change owner
   }
```
 - 以上例子常用于权限管控场景