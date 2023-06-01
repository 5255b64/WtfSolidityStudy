https://github.com/AmazingAng/WTF-Solidity/blob/main/06_ArrayAndStruct/ArrayAndStruct.sol
---
## 数组和结构体
### 数组
 - 数组分为2种
    - 固定长度数组（fixed-sized）
    - 可变长度数组（dynamically-sized）
#### 固定长度数组（fixed-sized）
 - 声明为 T[k]
    - T表示数据类型
    - k表示数组长度
```solidity
    // fixed-length array
    uint[8] array1;
    byte[5] array2;
    address[100] array3;
```
#### 可变长度数组（dynamically-sized）
 - 声明为 T[]
    - T表示数据类型
```solidity
    // variable-length array
    uint[] array4;
    byte[] array5;
    address[] array6;
    bytes array7;
```
 - Notice: bytes is special case, it is a dynamic array, but you don't need to add [] to it. You can use either bytes or bytes1[] to declare byte array, but not byte[]. bytes is recommended and consumes less gas than bytes1[].
#### 数组创建规则：
    - 对于memory可变长度数组，可使用关键字new声明变量，并且声明时必须指定数组长度（该长度不可变）。
```solidity
    // memory dynamic array
    uint[] memory array8 = new uint[](5);
    bytes memory array9 = new bytes(9);
```
    - 可使用以下方式声明可变长数组，声明时必须给定初始数组长度（用于分配初始内存）。
```solidity
    uint[] memory x = new uint[](3);
    x[0] = 1;
    x[1] = 3;
    x[2] = 4;
```
#### 数组的成员变量&函数
 - length
    - 数组长度
    - 对于memory数组来说，该变量是固定的。
 - push()
    - 等价于push(0)
 - push(x)
 - pop()

### 结构体（Struct）
 - 结构体声明
```solidity
    // struct
    struct Student{
        uint256 id;
        uint256 score; 
    }

    Student student; // Initially a student structure
```
 - 结构体初始化的4种方法

```solidity
    //  assign value to structure
    // Method 1: Create a storage struct reference in the function
    function initStudent1() external{
        Student storage _student = student; // assign a copy of student
        _student.id = 11;
        _student.score = 100;
    }
```

```solidity
     // Method 2: Directly refer to the struct of the state variable
    function initStudent2() external{
        student.id = 1;
        student.score = 80;
    }
```

```solidity
    // Method 3: struct constructor
    function initStudent3() external {
        student = Student(3, 90);
    }
```

```solidity
    // Method 4: key value
    function initStudent4() external {
        student = Student({id: 4, score: 60});
    }
```