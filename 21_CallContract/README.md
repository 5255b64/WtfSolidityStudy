https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/21_CallContract_en/readme.md
---
# 调用外部合约的几种方式
## 方式1：根据合约地址进行调用
 - _Name(_Address).f()
    - _Name为合约名（等同于java类名）
    - _Address为已部署合约的地址
    - f是需要调用的目标函数
```solidity
    function callSetX(address _Address, uint256 x) external{
        OtherContract(_Address).setX(x);
    }
```
## 方式2：根据合约变量进行调用
 - 与方式1的区别在于，入参直接声明为目标合约类型OtherContract，其余相同。
```solidity
    function callGetX(OtherContract _Address) external view returns(uint x){
        x = _Address.getX();
    }
```
## 方式3：创建合约变量
 - 与方式2的区别在于：方式2直接在入参构建合约变量，而方式3根据合约地址，在函数体内构建合约变量。
```solidity
     function callGetX2(address _Address) external view returns(uint x){
        OtherContract oc = OtherContract(_Address);
        x = oc.getX();
    }
```

## 调用函数的同时发送ETH
 - 如果调用的目标是payable的，那么可以向它发送ETH。
     - 语法 _Name(_Address).f{value: _Value}()

```solidity
    function setXTransferETH(address otherContract, uint256 x) payable external{
        OtherContract(otherContract).setX{value: msg.value}(x);
    }
```