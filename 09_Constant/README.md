https://www.wtf.academy/en/solidity-start/Constant/
---
##
 - 常量constant 和 不变量immutable
    - 合理使用这两个关键字可以降低gas
    - 当一个状态变量被[constant|immutable]修饰时，变量值在编译之后不能修改。
    - Value-typed可以被声明为[constant|immutable]，而string和bytes不行。
 - constant的值在编译时确定
 - immutable的值在编译或者构造时确定