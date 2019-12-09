# Window - 浏览器对象模型
https://www.runoob.com/jsref/obj-window.html

浏览器对象模型 (BOM) 使 JavaScript 有能力与浏览器"对话"

### 浏览器对象模型 (BOM)
浏览器对象模型（Browser Object Model (BOM)）尚无正式标准

由于现代浏览器已经（几乎）实现了 JavaScript 交互性方面的相同方法和属性，因此常被认为是 BOM 的方法和属性

## Window 对象
所有浏览器都支持 window 对象。它表示浏览器窗口。

所有 JavaScript 全局对象、函数以及变量均自动成为 window 对象的成员

HTML DOM 的 document 也是 window 对象的属性之一
````
window.document.getElementById("header");
````
### Window 尺寸
有三种方法能够确定浏览器窗口的尺寸
- 对于Internet Explorer、Chrome、Firefox、Opera 以及 Safari
  - window.innerHeight - 浏览器窗口的内部高度(包括滚动条)
  - window.innerWidth - 浏览器窗口的内部宽度(包括滚动条)
- 对于 Internet Explorer 8、7、6、5
  - document.documentElement.clientHeight
  - document.documentElement.clientWidth
- 或者
  - document.body.clientHeight
  - document.body.clientWidth
### 其他 Window 方法
- window.open() - 打开新窗口
- window.close() - 关闭当前窗口
- window.moveTo() - 移动当前窗口
- window.resizeTo() - 调整当前窗口的尺寸

## Window Screen
window.screen 对象包含有关用户屏幕的信息

### Window Screen 可用宽度
screen.availWidth 属性返回访问者屏幕的宽度，以像素计，减去界面特性，比如窗口任务栏
````
<script>
document.write("可用宽度: " + screen.availWidth);
</script>
````
### Window Screen 可用高度
screen.availHeight 属性返回访问者屏幕的高度，以像素计，减去界面特性，比如窗口任务栏。
````
<script>
document.write("可用高度: " + screen.availHeight);
</script>
````

## Window Location
window.location 对象用于获得当前页面的地址 (URL)，并把浏览器重定向到新的页面
### Location 对象属性
- host	返回一个URL的主机名和端口
- hostname	返回URL的主机名
- href	返回完整的URL
- pathname	返回的URL路径名
- port	返回一个URL服务器使用的端口号
- protocol	返回一个URL协议
- search	返回一个URL的查询部分
### Location 对象方法
- assign()	载入一个新的文档
- reload()	重新载入当前文档
- replace()	用新的文档替换当前文档

## Window History
window.history 对象包含浏览器的历史

### History 对象属性
- length	返回历史列表中的网址数

### History 对象方法
- back() 加载 history 列表中的前一个 URL
````
  window.history.back()
````
- forward()	加载 history 列表中的下一个 URL
````
  window.history.forward()
````
- go() 加载 history 列表中的某个具体页面
````
  window.history.go(-2)
````

## Window Navigator
window.navigator 对象包含有关访问者浏览器的信息

### Navigator 对象属性
- appCodeName	返回浏览器的代码名
- appName	返回浏览器的名称
- appVersion	返回浏览器的平台和版本信息
- cookieEnabled	返回指明浏览器中是否启用 cookie 的布尔值
- platform	返回运行浏览器的操作系统平台
- userAgent	返回由客户机发送服务器的user-agent 头部的值
````
<script>
txt = "<p>浏览器代号: " + navigator.appCodeName + "</p>";
txt+= "<p>浏览器名称: " + navigator.appName + "</p>";
txt+= "<p>浏览器版本: " + navigator.appVersion + "</p>";
txt+= "<p>启用Cookies: " + navigator.cookieEnabled + "</p>";
txt+= "<p>硬件平台: " + navigator.platform + "</p>";
txt+= "<p>用户代理: " + navigator.userAgent + "</p>";
txt+= "<p>用户代理语言: " + navigator.systemLanguage + "</p>";
document.getElementById("example").innerHTML=txt;
````

### Navigator 对象方法
- javaEnabled()	指定是否在浏览器中启用Java
- taintEnabled()	规定浏览器是否启用数据污点(data tainting)

## JavaScript 存储对象
Web 存储 API 提供了 sessionStorage （会话存储） 和 localStorage（本地存储）两个存储对象来对网页的数据进行添加、删除、修改、查询操作

- localStorage 用于长久保存整个网站的数据，保存的数据没有过期时间，直到手动去除
- sessionStorage 用于临时保存同一窗口(或标签页)的数据，在关闭窗口或标签页之后将会删除这些数据

### 存储对象属性
- length	返回存储对象中包含多少条数据

### 存储对象方法
- key(n)	返回存储对象中第 n 个键的名称
- getItem(keyname)	返回指定键的值
- setItem(keyname, value)	添加键和值，如果对应的值存在，则更新该键对应的值
- removeItem(keyname)	移除键
- clear()	清除存储对象中所有的键

## JavaScript 弹窗
可以在 JavaScript 中创建三种消息框：警告框、确认框、提示框

### 警告框
当警告框出现后，用户需要点击确定按钮才能继续进行操作

语法：window.alert("sometext");
注意：window.alert() 方法可以不带上window对象，直接使用alert()方法
````
function myFunction()
{
    alert("你好，我是一个警告框！");
}
````
### 确认框
确认框通常用于验证是否接受用户操作
语法：window.confirm("sometext");
````
var r=confirm("按下按钮");
if (r==true)
{
    x="你按下了\"确定\"按钮!";
}
else
{
    x="你按下了\"取消\"按钮!";
}
````
### 提示框
提示框经常用于提示用户在进入页面前输入某个值
语法：window.prompt("sometext","defaultvalue");
````
var person=prompt("请输入你的名字","Harry Potter");
if (person!=null && person!="")
{
    x="你好 " + person + "! 今天感觉如何?";
    document.getElementById("demo").innerHTML=x;
}
````

### 换行
弹窗使用 反斜杠 + "n"(\n) 来设置换行
````
alert("Hello\nHow are you?");
````

## JavaScript 计时事件
一个设定的时间间隔之后来执行代码,称之为计时事件

### setInterval() 方法
setInterval() 间隔指定的毫秒数不停地执行指定的代码
语法：window.setInterval("javascript function",milliseconds);

clearInterval() 方法用于停止 setInterval() 方法执行的函数代码
````
myVar=setInterval("javascript function",milliseconds);
````
注意：要使用 clearInterval() 方法, 在创建计时方法时你必须使用全局变量：

````
setInterval(function(){alert("Hello")},3000);

<script>
    var myVar=setInterval(function(){myTimer()},1000);
    function myTimer(){
        var d=new Date();
        var t=d.toLocaleTimeString();
        document.getElementById("demo").innerHTML=t;
    }
    function myStopFunction(){
        clearInterval(myVar);
    }
</script>
````

### setTimeout() 方法
在指定的毫秒数后执行指定代码
语法：myVar= window.setTimeout("javascript function", milliseconds);

clearTimeout() 方法用于停止执行setTimeout()方法的函数代码
````
myVar=setTimeout("javascript function",milliseconds);
````
注意：要使用clearTimeout() 方法, 你必须在创建超时方法中（setTimeout）使用全局变量
````
var myVar;
function myFunction()
{
        myVar=setTimeout(function(){alert("Hello")},3000);
}
function myStopFunction()
{
        clearTimeout(myVar);
}
````

## JavaScript Cookie
Cookie 用于存储 web 页面的用户信息

### 什么是 Cookie
Cookie 是一些数据, 存储于你电脑上的文本文件中。

当 web 服务器向浏览器发送 web 页面时，在连接关闭后，服务端不会记录用户的信息

Cookie 以名/值对形式存储，如下所示:username=John Doe

### 使用 JavaScript 创建Cookie
````
document.cookie="username=John Doe";
为 cookie 添加一个过期时间（以 UTC 或 GMT 时间）。默认情况下，cookie 在浏览器关闭时删除
document.cookie="username=John Doe; expires=Thu, 18 Dec 2043 12:00:00 GMT";
使用 path 参数告诉浏览器 cookie 的路径。默认情况下，cookie 属于当前页面
document.cookie="username=John Doe; expires=Thu, 18 Dec 2043 12:00:00 GMT; path=/";
````

### 使用JavaScript读取cookie
````
var x = document.cookie;
document.cookie 将以字符串的方式返回所有的 cookie，类型格式： cookie1=value; cookie2=value; cookie3=value;
````

### 使用 JavaScript 修改 Cookie
在 JavaScript 中，修改 cookie 类似于创建 cookie，旧的 cookie 将被覆盖
````
document.cookie="username=John Smith; expires=Thu, 18 Dec 2043 12:00:00 GMT; path=/";
````

### 使用 JavaScript 删除 Cookie
删除 cookie 非常简单。您只需要设置 expires 参数为以前的时间即可
注意：当删除时不必指定 cookie 的值
````
document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
````