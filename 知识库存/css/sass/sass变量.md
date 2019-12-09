### sass变量
变量用于存储一些信息，它可以重复使用
Sass 变量可以存储以下信息：
+ 字符串
+ 数字
+ 颜色值
+ 布尔值
+ 列表
+ null值

语法：$variablename: value;
````
$myFont: Helvetica, sans-serif;
$myColor: red;
$myFontSize: 18px;
$myWidth: 680px;

body {
  font-family: $myFont;
  font-size: $myFontSize;
  color: $myColor;
}

#container {
  width: $myWidth;
}
````
### sass作用域
Sass 变量的作用域只能在当前的层级上有效果
````
$myColor: red;

h1 {
  $myColor: green;   // 只在 h1 里头有用，局部作用域
  color: $myColor;
}

p {
  color: $myColor;
}
````
### !global
Sass 中我们可以使用 !global 关键词来设置变量是全局的
````
$myColor: red;

h1 {
  $myColor: green !global;  // 全局作用域
  color: $myColor;
}

p {
  color: $myColor;
}
````
