https://github.com/AmazingAng/WTF-Solidity/blob/main/10_InsertionSort/InsertionSort.sol
---
## 控制流
 - if-else
```solidity
function ifElseTest(uint256 _number) public pure returns(bool){
    if(_number == 0){
    return(true);
    }else{
    return(false);
    }
}
```
 - for loop
```solidity
function forLoopTest() public pure returns(uint256){
    uint sum = 0;
    for(uint i = 0; i < 10; i++){
    sum += i;
    }
    return(sum);
}
```
 - while loop
```solidity
function whileTest() public pure returns(uint256){
    uint sum = 0;
    uint i = 0;
    while(i < 10){
    sum += i;
    i++;
    }
    return(sum);
}
```
 - do-while loop
```solidity
function doWhileTest() public pure returns(uint256){
    uint sum = 0;
    uint i = 0;
    do{
    sum += i;
    i++;
    }while(i < 10);
    return(sum);
}
```
 - Conditional (ternary) operator 
```solidity
// ternary/conditional operator
function ternaryTest(uint256 x, uint256 y) public pure returns(uint256){
    // return the max of x and y
    return x >= y ? x: y; 
}
```
 - 循环语句中可以使用[continue|break]关键字
