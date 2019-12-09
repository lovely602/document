## JavaScript 对象
https://www.runoob.com/jsref/jsref-obj-array.html

JavaScript 中的所有事物都是对象：字符串、数值、数组、函数...
对象只是一种特殊的数据。对象拥有属性和方法
### 访问对象的属性
语法：objectName.propertyName
````
var message="Hello World!";
var x=message.length;
````
### 访问对象的方法
语法：objectName.methodName()
````
var message="Hello world!";
var x=message.toUpperCase();
````
### JavaScript 类
- JavaScript 是面向对象的语言，但 JavaScript 不使用类。
  
- 在 JavaScript 中，不会创建类，也不会通过类来创建对象（就像在其他面向对象的语言中那样）。
  
- JavaScript 基于 prototype，而不是基于类的。

### JavaScript for...in 循环
JavaScript for...in 语句循环遍历对象的属性。
注意： for...in 循环中的代码块将针对每个属性执行一次
语法：
````
var person={fname:"John",lname:"Doe",age:25};
for (x in person)
{
    txt=txt + person[x];
}
````
## JavaScript prototype（原型对象）
所有的 JavaScript 对象都会从一个 prototype（原型对象）中继承属性和方法：
- Date 对象从 Date.prototype 继承。
- Array 对象从 Array.prototype 继承。
- Person 对象从 Person.prototype 继承。

在对象的构造函数中添加属性或方法，使用 prototype 属性就可以给对象的构造函数添加新的属性
````
function Person(first, last, age, eyecolor) {
  this.firstName = first;
  this.lastName = last;
  this.age = age;
  this.eyeColor = eyecolor;
}

Person.prototype.nationality = "English";

function Person(first, last, age, eyecolor) {
  this.firstName = first;
  this.lastName = last;
  this.age = age;
  this.eyeColor = eyecolor;
}

Person.prototype.name = function() {
  return this.firstName + " " + this.lastName;
};
````
## JavaScript Number 对象
JavaScript 只有一种数字类型,所有 JavaScript 数字均为 64 位
- 精度 整数（不使用小数点或指数计数法）最多为 15 位
- 八进制和十六进制 如果前缀为 0，则 JavaScript 会把数值常量解释为八进制数，如果前缀为 0 和 "x"，则解释为十六进制数
- 无穷大（Infinity） 当数字运算结果超过了JavaScript所能表示的数字上限（溢出），结果为一个特殊的无穷大（infinity）值，在JavaScript中以Infinity表示。
                     同样地，当负数的值超过了JavaScript所能表示的负数范围，结果为负无穷大，在JavaScript中以-Infinity表示
- NaN - 非数字值 NaN 属性是代表非数字值的特殊值。该属性用于指示某个值不是数字
- 数字可以是数字或者对象

### Number对象方法
- isFinite	检测指定参数是否为无穷大
- toFixed(x)	把数字转换为字符串，结果的小数点后有指定位数的数字
- toPrecision(x)	把数字格式化为指定的长度
- toString()	把数字转换为字符串，使用指定的基数
````
var x = 999999999999999;   // x 为 999999999999999
var y = 9999999999999999;  // y 为 10000000000000000

var y = 0377;
var z = 0xFF;

myNumber=2;
while (myNumber!=Infinity)
{
    myNumber=myNumber*myNumber; // 重复计算直到 myNumber 等于 Infinity
}

可以使用 isNaN() 全局函数来判断一个值是否是 NaN 值
var x = 1000 / "Apple";
isNaN(x); // 返回 true
var y = 100 / "1000";
isNaN(y); // 返回 false

var x = 123;
var y = new Number(123);
typeof(x) // 返回 Number
typeof(y) // 返回 Object
````

## JavaScript String 对象
### 字符串（String）
字符串（String）使用长度属性length来计算字符串的长度
````
var txt="Hello World!";
document.write(txt.length);

var txt="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
document.write(txt.length);
````
### 在字符串中查找字符串
字符串使用 indexOf() 来定位字符串中某一个指定的字符首次出现的位置,如果没找到对应的字符函数返回-1
````
var str="Hello world, welcome to the universe.";
var n=str.indexOf("welcome");
````
### 内容匹配
match()函数用来查找字符串中特定的字符，并且如果找到的话，则返回这个字符
````
var str="Hello world!";
document.write(str.match("world") + "<br>");
document.write(str.match("World") + "<br>");
document.write(str.match("world!"));
````
### 替换内容
replace() 方法在字符串中用某些字符替换另一些字符
````
str="Please visit Microsoft!"
var n=str.replace("Microsoft","Runoob");
````
### 字符串大小写转换
字符串大小写转换使用函数 toUpperCase() / toLowerCase():
````
var txt="Hello World!";       // String
var txt1=txt.toUpperCase();   // txt1 文本会转换为大写
var txt2=txt.toLowerCase();   // txt2 文本会转换为小写
````
### 字符串转为数组
字符串使用split()函数转为数组
````
txt="a,b,c,d,e"   // String
txt.split(",");   // 使用逗号分隔
txt.split(" ");   // 使用空格分隔
txt.split("|");   // 使用竖线分隔 
````

### 特殊字符
Javascript 中可以使用反斜线（\）插入特殊符号，如：撇号,引号等其他特殊符号
````
var txt="We are the so-called \"Vikings\" from the north.";
document.write(txt);
````
## JavaScript Boolean 对象
Boolean 对象用于转换一个不是 Boolean 类型的值转换为 Boolean 类型值 (true 或者false)

### toString()	
把布尔值转换为字符串，并返回结果
### valueOf()	
返回 Boolean 对象的原始值


## JavaScript Date（日期） 对象
日期对象用于处理日期和时间

### getDate()	
从 Date 对象返回一个月中的某一天 (1 ~ 31)
### getDay()	
从 Date 对象返回一周中的某一天 (0 ~ 6)
### getFullYear()
从 Date 对象以四位数字返回年份
### getHours()
返回 Date 对象的小时 (0 ~ 23)
### getMinutes()	
返回 Date 对象的分钟 (0 ~ 59)
### getTime()
getTime() 返回从 1970 年 1 月 1 日至今的毫秒数

## JavaScript Math（算数） 对象
Math（算数）对象的作用是：执行常见的算数任务
### abs(x)	
返回 x 的绝对值
### round()
执行四舍五入计算

### random()
返回 0 ~ 1 之间的随机数

### max()
返回 x,y,z,...,n 中的最高值

### min()
返回 x,y,z,...,n中的最低值