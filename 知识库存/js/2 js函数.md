## JavaScript 函数定义
JavaScript 使用关键字 function 定义函数

### 函数声明
通过声明定义函数
````
function functionName(parameters) {
  执行的代码
}
````
### 函数表达式
通过表达式定义函数，匿名函数
````
var x = function (a, b) {return a * b};
var z = x(4, 3);
````

### Function() 构造函数
通过内置的javaScript函数构造器Function定义
````
var myFunction = new Function("a", "b", "return a * b");
var x = myFunction(4, 3);
````

### 箭头函数
箭头函数表达式的语法比普通函数表达式更简洁

````
(参数1, 参数2, …, 参数N) => { 函数声明 }

(参数1, 参数2, …, 参数N) => 表达式(单一)

(单一参数) => {函数声明}

 单一参数 => {函数声明}
 
 () => {函数声明}
````
注意：
  - 当我们使用箭头函数的时候，箭头函数会默认帮我们绑定外层 this 的值，所以在箭头函数中 this 的值和外层的 this 是一样的
  - 如果函数部分只是一个语句，则可以省略 return 关键字和大括号 {}，这样做是一个比较好的习惯

## JavaScript 函数参数

JavaScript 函数对参数的值没有进行任何的检查。

### 函数显式参数(Parameters)与隐式参数(Arguments)
````
functionName(parameter1, parameter2, parameter3) {
    // 要执行的代码……
}
````
函数显式参数在函数定义时列出
函数隐式参数在函数调用时传递给函数真正的值

### 参数规则
1. JavaScript 函数定义显式参数时没有指定数据类型。
2. JavaScript 函数对隐式参数没有进行类型检测
3. JavaScript 函数对隐式参数的个数没有进行检测

### 默认参数
ES5 中如果函数在调用时未提供隐式参数，参数会默认设置为： undefined
````
function myFunction(x, y) {
    y = y || 0;
}
````
### ES6 函数可以自带参数
ES6 支持函数带有默认参数，就判断 undefined 和 || 的操作
````
function myFunction(x, y = 10) {
    // y is 10 if not passed or undefined
    return x + y;
}

myFunction(0, 2) // 输出 2
myFunction(5); // 输出 15, y 参数的默认值
````

### arguments 对象
JavaScript 函数有个内置的对象 arguments 对象。
+ 通过值传递参数,函数仅仅只是获取值。如果函数修改参数的值，不会修改显式参数的初始值（在函数外定义）
+ 通过对象传递参数，在函数内部修改对象的属性就会修改其初始的值。
argument 对象包含了函数调用的参数数组。
````
x = findMax(1, 123, 500, 115, 44, 88);

function findMax() {
    var i, max = arguments[0];
   
    if(arguments.length < 2) return max;

    for (i = 0; i < arguments.length; i++) {
        if (arguments[i] > max) {
            max = arguments[i];
        }
    }
    return max;
}
````
## JavaScript 函数调用
JavaScript 函数有 4 种调用方式。

### this 关键字
一般而言，在Javascript中，this指向函数执行时的当前对象

### 作为一个函数调用
当函数没有被自身的对象调用时 this 的值就会变成全局对象
````
function myFunction(a, b) {
    return a * b;
}
myFunction(10, 2);           // myFunction(10, 2) 返回 20
````

### 函数作为方法调用
在 JavaScript 中你可以将函数定义为对象的方法
````
var myObject = {
    firstName:"John",
    lastName: "Doe",
    fullName: function () {
        return this.firstName + " " + this.lastName;
    }
}
myObject.fullName();         // 返回 "John Doe"
````

### 使用构造函数调用函数
如果函数调用前使用了 new 关键字, 则是调用了构造函数
````
// 构造函数:
function myFunction(arg1, arg2) {
    this.firstName = arg1;
    this.lastName  = arg2;
}

// This creates a new object
var x = new myFunction("John","Doe");
x.firstName;                             // 返回 "John"
````

### 作为函数方法调用函数
- 在 JavaScript 中, 函数是对象。JavaScript 函数有它的属性和方法
- call() 和 apply() 是预定义的函数方法。 两个方法可用于调用函数，两个方法的第一个参数必须是对象本身

两个方法都使用了对象本身作为第一个参数。 
两者的区别在于第二个参数： apply传入的是一个参数数组，也就是将多个参数组合成为一个数组传入，
                           而call则作为call的参数传入（从第二个参数开始）。

+ 在 JavaScript 严格模式(strict mode)下, 在调用函数时第一个参数会成为 this 的值， 即使该参数不是一个对象
+ 在 JavaScript 非严格模式(non-strict mode)下, 如果第一个参数的值是 null 或 undefined, 它将使用全局对象替代