https://github.com/AmazingAng/WTF-Solidity/blob/main/Languages/en/18_Import_en/readme.md
---
# Import
 - 使用import可以向当前的global scope中引入外部代码，使开发过程更模块化。
 - 若没有特殊标注，被import的文件中的所有代码都会写入当前global scope。
 - Generally, if not specified, all global symbols of the imported file will be imported into the current global scope.
# import关键字
import关键字的用法：
 1. 根据文件相对位置进行导入
```solidity
Hierarchy
├── Import.sol
└── Yeye.sol

// Import by relative location of source file
import './Yeye.sol';
```
 2. 根据url导入
```solidity
// Import by URL
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol';
```
 3. 通过npm导入
```solidity
import '@openzeppelin/contracts/access/Ownable.sol';
```
 4. 只导入文件中的特定合约代码
```solidity
import {Yeye} from './Yeye.sol';
```
