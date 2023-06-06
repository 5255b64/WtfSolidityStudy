https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/22_Call_en/readme.md
---
# call()函数
 - call()是address数据类型的底层函数，用于与外部合约进行交互。
 - call()的返回值为(bool, data)
 - call()函数主要用于ETH转账，会出发目标合约的fallback or receive函数。
 - call()不建议用于调用外部合约的其他函数，因为可能会被恶意合约得到控制权。
    - 当调用外部合约时，建议构建合约引用，再调用其函数。
    - 当无法获得合约代码（或ABI）时，无法创建合约引用，此时可以使用call()函数来调用目标合约的函数。
## call()语法
 - 
```solidity
targetContractAddress.call(binary code);
```
 - 其中binary code通过abi.encodeWithSignature生成
```solidity
abi.encodeWithSignature("function signature", parameters separated by comma)
```
 - 举例如下
```solidity
abi.encodeWithSignature("f(uint256,address)", _x, _addr)
```
 - 此外，调用call()时还可以附带ETH和gas信息：
```solidity
contractAdress.call{value:ETH value, gas:gas limit}(binary code);
```
## 实例
### 被调用合约
```solidity
contract OtherContract {
    uint256 private _x = 0; // state variable x
    // Receiving ETH event, log the amount and gas
    event Log(uint amount, uint gas);

    fallback() external payable{}

    // get the balance of the contract
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    // set the value of _x, as well as receiving ETH (payable)
    function setX(uint256 x) external payable{
        _x = x;
        // emit Log event when receiving ETH
        if(msg.value > 0){
            emit Log(msg.value, gasleft());
        }
    }

    // read the value of x
    function getX() external view returns(uint x){
        x = _x;
    }
}
```
### 使用call进行调用
 1. Response Event
```solidity
// Declare Response event, with parameters success and data
event Response(bool success, bytes data);
```
 2. Call setX function
```solidity
// Declare Response event, with parameters success and data
event Response(bool success, bytes data);
```
 3. Call getX function
```solidity
function callGetX(address _addr) external returns(uint256){
	// call getX()
	(bool success, bytes memory data) = _addr.call(
		abi.encodeWithSignature("getX()")
	);

	emit Response(success, data); //emit event 
	return abi.decode(data, (uint256));
}
```
 4. Call undeclared function
```solidity
function callNonExist(address _addr) external{
	// call getX()
	(bool success, bytes memory data) = _addr.call(
		abi.encodeWithSignature("foo(uint256)")
	);

	emit Response(success, data); //emit event
}
```