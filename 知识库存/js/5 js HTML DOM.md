# JavaScript HTML DOM
https://www.runoob.com/jsref/dom-obj-document.html

- DOM (Document Object Model) 译为文档对象模型，是 HTML 和 XML 文档的编程接口。
- HTML DOM 定义了访问和操作 HTML 文档的标准方法。
- DOM 以树结构表达 HTML 文档

## HTML DOM 节点
根据 W3C 的 HTML DOM 标准，HTML 文档中的所有内容都是节点:
- 整个文档是一个文档节点
- 每个 HTML 元素是元素节点
- 每个 HTML 属性是属性节点
- HTML 元素内的文本是文本节点
- 注释是注释节点
### HTML DOM 节点树
HTML DOM 将 HTML 文档视作树结构。这种结构被称为节点树
### 节点父、子和同胞
常用父（parent）、子（child）和同胞（sibling）等术语来描述这些关系。父节点拥有子节点。同级的子节点被称为同胞（兄弟或姐妹）
- 在节点树中，顶端节点被称为根（root）
- 每个节点都有父节点、除了根（它没有父节点）
- 一个节点可拥有任意数量的子节点
- 同胞是拥有相同父节点的节点


## HTML DOM 方法
HTML DOM 方法是我们可以在节点（HTML 元素）上执行的动作。

HTML DOM 属性是我们可以在节点（HTML 元素）设置和修改的值.

### 常用属性
- innerHTML - 节点（元素）的文本值
- parentNode - 节点（元素）的父节点
- childNodes - 节点（元素）的子节点
- attributes - 节点（元素）的属性节点
### 常用方法
- getElementById()	返回带有指定 ID 的元素
- getElementsByTagName()	返回包含带有指定标签名称的所有元素的节点列表（集合/节点数组）
- getElementsByClassName()	返回包含带有指定类名的所有元素的节点列表
- appendChild()	把新的子节点添加到指定节点
- removeChild()	删除子节点
- replaceChild()	替换子节点
- insertBefore()	在指定的子节点前面插入新的子节点
- createAttribute()	创建属性节点
- createElement()	创建元素节点
- createTextNode()	创建文本节点
- getAttribute()	返回指定的属性值
- setAttribute()	把指定属性设置或修改为指定的值


### HTML DOM 属性
属性是节点（HTML 元素）的值，您能够获取或设置

### innerHTML 属性
获取元素内容的最简单方法是使用 innerHTML 属性
````
var txt=document.getElementById("intro").innerHTML;
document.write(txt);
````
### nodeName 属性
nodeName 属性规定节点的名称
- nodeName 是只读的
- 元素节点的 nodeName 与标签名相同
- 属性节点的 nodeName 与属性名相同
- 文本节点的 nodeName 始终是 #text
- 文档节点的 nodeName 始终是 #document
### nodeValue 属性
nodeValue 属性规定节点的值
- 元素节点的 nodeValue 是 undefined 或 null
- 文本节点的 nodeValue 是文本本身
- 属性节点的 nodeValue 是属性值
### nodeType 属性
nodeType 属性返回节点的类型。nodeType 是只读的

|元素类型|nodeType|
|---|---|
|元素|1|
|属性|2|
|文本|3|
|注释|8|
|文档|9|


## HTML DOM - 修改
修改 HTML = 改变元素、属性、样式和事件
### 改变HTML的元素
如需向 HTML DOM 添加新元素，您首先必须创建该元素（元素节点），然后把它追加到已有的元素上
````
<div id="div1">
<p id="p1">这是一个段落。</p>
<p id="p2">这是另一个段落。</p>
</div>
<script>
var para=document.createElement("p");
var node=document.createTextNode("这是一个新段落。");
para.appendChild(node);
var element=document.getElementById("div1");
element.appendChild(para);
</script>
````
### 改变 HTML 输出流
JavaScript 能够创建动态的 HTML 内容

注意：不要在文档(DOM)加载完成之后使用 document.write()。这会覆盖该文档
````
<script>
   document.write(Date());
</script>
````
### 改变 HTML 内容
语法：document.getElementById(id).innerHTML=新的 HTML
````
<script>
document.getElementById("p1").innerHTML="新文本!";
</script>
````
### 改变 HTML 属性
语法：document.getElementById(id).attribute=新属性值
````
<script>
document.getElementById("image").src="landscape.jpg";
</script>
````
### 改变 HTML 样式
语法：document.getElementById(id).style.property=新样式
````
<script>
document.getElementById("p2").style.color="blue";
document.getElementById("p2").style.fontFamily="Arial";
document.getElementById("p2").style.fontSize="larger";
</script>
````

# Document 对象
当浏览器载入 HTML 文档,当网页被加载时，浏览器会创建页面的文档对象模型（Document Object Model）

Document 对象是 HTML 文档的根节点。

Document 对象使我们可以从脚本中对 HTML 页面中的所有元素进行访问。

提示：Document 对象是 Window 对象的一部分，可通过 window.document 属性对其进行访问。

## HTML DOM 元素对象
### 元素对象
在 HTML DOM 中, 元素对象代表着一个 HTML 元素
元素对象 的 子节点可以是, 可以是元素节点，文本节点，注释节点

### addEventListener() 方法
语法：element.addEventListener(event, function, useCapture);

- 第一个参数是事件的类型 (如 "click" 或 "mousedown")。不要使用 "on" 前缀。 例如，使用 "click" ,而不是使用 "onclick"。
- 第二个参数是事件触发后调用的函数。
- 第三个参数是个布尔值用于描述事件是冒泡还是捕获。该参数是可选的

添加事件监听的特点：
1. addEventListener() 方法用于向指定元素添加事件句柄
2. addEventListener() 方法添加的事件句柄不会覆盖已存在的事件句柄。
3. 可以向一个元素添加多个事件句柄
4. 可以向同个元素添加多个同类型的事件句柄，如：两个 "click" 事件
5. 可以向任何 DOM 对象添加事件监听，不仅仅是 HTML 元素。如： window 对象
6. 可以使用 removeEventListener() 方法来移除事件的监听

注意：对于不支持addEventListener() 和 removeEventListener() 方法的浏览器可使用以下方法添加监听
- element.attachEvent(event, function);
- element.detachEvent(event, function);

### 事件冒泡或事件捕获
事件传递有两种方式：冒泡与捕获

1. 在 冒泡 中，内部元素的事件会先被触发，然后再触发外部元素，即： <p> 元素的点击事件先触发，然后会触发 <div> 元素的点击事件
2. 在 捕获 中，外部元素的事件会先被触发，然后才会触发内部元素的事件，即： <div> 元素的点击事件先触发 ，然后再触发 <p> 元素的点击事件

语法：addEventListener(event, function, useCapture);
addEventListener() 方法可以指定 "useCapture" 参数来设置传递类型：
默认值为 false, 即冒泡传递，当值为 true 时, 事件使用捕获传递

````
document.getElementById("myDiv").addEventListener("click", myFunction, true);
````

阻止事件传播
````
element.stopPropagation()
````

## HTML DOM 属性 对象

## Attr 对象
在 HTML DOM 中, Attr 对象 代表一个 HTML 属性。

HTML属性总是属于HTML元素。
## NamedNodeMap 对象
在 HTML DOM 中, the NamedNodeMap 对象 表示一个无顺序的节点列表。

我们可通过节点名称来访问 NamedNodeMap 中的节点。

### 属性或方法
- attr.isId	如果属性是 ID 类型，则 isId 属性返回 true，否则返回 false
````
document.getElementById("demo").attributes[0].isId;
````
- attr.name	返回属性名称
- attr.value	设置或者返回属性值
- nodemap.getNamedItem()	从节点列表中返回的指定属性节点
- nodemap.item()	返回节点列表中处于指定索引号的节点
- nodemap.length	返回节点列表的节点数目
- nodemap.removeNamedItem()	删除指定属性节点
- nodemap.setNamedItem()	设置指定属性节点(通过名称)


## HTML DOM 事件
HTML DOM 事件允许Javascript在HTML文档元素中注册不同事件处理程序

### 鼠标事件
- onclick	当用户点击某个对象时调用的事件句柄
- ondblclick	当用户双击某个对象时调用的事件句柄
- onmouseover	鼠标移到某元素之上
- onmousedown	鼠标按钮被按下
- onmouseout	鼠标从某元素移开

### 键盘事件
- onkeydown	某个键盘按键被按下
- onkeypress	某个键盘按键被按下并松开
- onkeyup	某个键盘按键被松开

### 框架/对象（Frame/Object）事件
- onload	一张页面或一幅图像完成加载
- onunload	用户退出页面。

### 表单事件
- onblur	元素失去焦点时触发
- onchange	该事件在表单元素的内容改变时触发
- onfocus	元素获取焦点时触发
- oninput	元素获取用户输入时触发
- onreset	表单重置时触发
- onsearch	用户向搜索域输入文本时触发
- onselect	用户选取文本时触发
- onsubmit	表单提交时触发

### 事件对象
- bubbles	返回布尔值，指示事件是否是起泡事件类型
- target	返回触发此事件的元素（事件的目标节点）
- type	返回当前 Event 对象表示的事件的名称
- initEvent()	初始化新创建的 Event 对象的属性
- preventDefault()	通知浏览器不要执行与事件关联的默认动作
- stopPropagation()	不再派发事件

### 目标事件对象
- addEventListener()	允许在目标事件中注册监听事件
- dispatchEvent()	允许发送事件到监听器上
- removeEventListener()	运行一次注册在事件目标上的监听事件

### 事件监听对象
- handleEvent()	把任意对象注册为事件处理程序

### 文档事件对象
- createEvent()

### 鼠标/键盘事件对象
- ctrlKey	返回当事件被触发时，"CTRL" 键是否被按下
- clientX	返回当事件被触发时，鼠标指针的水平坐标
- clientY	返回当事件被触发时，鼠标指针的垂直坐标
- charCode	返回onkeypress事件触发键值的字母代码
- keyCode	返回onkeypress事件触发的键的值的字符代码，或者 onkeydown 或 onkeyup 事件的键的代码

## Console 对象
Console 对象提供了访问浏览器调试模式的信息到控制台
- error()	输出错误信息到控制台
- log()	控制台输出一条信息
- warn()	输出警告信息，信息最前面加一个黄色三角，表示警告

## HTML DOM 集合(Collection)

HTMLCollection 是 HTML 元素的集合<br>
HTMLCollection 元素可以通过 name，id 或索引来获取
- HTMLCollection 对象 getElementsByTagName() 方法返回的就是 HTMLCollection 对象
- HTMLCollection 对象的 length 属性定义了集合中元素的数量

注意：HTMLCollection不是数组，没有类似pop,push等方法，但是可以使用其length属性。
- item()	返回 HTMLCollection 中指定索引的元素
- length	返回 HTMLCollection 中元素的数量
````
var x = document.getElementsByTagName("p");
document.getElementsByTagName("P").item(0).innerHTML = "段落已修改";
````

## HTML DOM 节点列表
NodeList 对象是一个从文档中获取的节点列表 (集合)。
NodeList 是一个文档节点的集合.<br>
NodeList 只能通过索引来获取
所有浏览器的 childNodes 属性返回的是 NodeList 对象。
````
var myNodelist = document.querySelectorAll("p");
````
























