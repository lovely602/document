# jQuery简介
jQuery 是一个 JavaScript 库。

jQuery 极大地简化了 JavaScript 编程。

### jQuery语法
jQuery 语法是通过选取 HTML 元素，并对选取的元素执行某些操作

基础语法： $(selector).action()
- 美元符号定义 jQuery
- 选择符（selector）"查询"和"查找" HTML 元素
- jQuery 的 action() 执行对元素的操作

### 文档就绪事件
为了防止文档在完全加载（就绪）之前运行 jQuery 代码，即在 DOM 加载完成后才可以对 DOM 进行操作
````
$(document).ready(function(){
 
   // 开始写 jQuery 代码...
 
});

$(function(){
 
   // 开始写 jQuery 代码...
 
});

window.onload = function () {
    // 执行代码
}
````

## jQuery选择器
jQuery 选择器基于元素的 id、类、类型、属性、属性值等"查找"（或选择）HTML 元素

### 元素选择器
jQuery 元素选择器基于元素名选取元素
````
$(document).ready(function(){
  $("button").click(function(){
    $("p").hide();
  });
});
````

### #id 选择器
jQuery #id 选择器通过 HTML 元素的 id 属性选取指定的元素
````
$(document).ready(function(){
  $("button").click(function(){
    $("#test").hide();
  });
});
````

### .class 选择器
jQuery 类选择器可以通过指定的 class 查找元素
````
$(document).ready(function(){
  $("button").click(function(){
    $(".test").hide();
  });
});
````

## jQuery事件
常见 DOM事件

|鼠标事件|键盘事件|表单事件|文档事件|
|---|---|---|---|
|click|keypress|submit|load|
|dblclick|keydown|change|resize|
|mouseenter|keyup|focus|scroll|
|mouseleave||blur|unload|
|hover||||

````
$("p").click(function(){
    // 动作触发后执行的代码!!
});
````
