## CSS2选择器

### .class 选择器
指定类的所有元素的样式
````
.intro
{
background-color:yellow;
}
````

### #id 选择器
指定具有ID的元素的样式
````
#firstname
{
background-color:yellow;
}
````

### * 选择器
选择所有元素。
也可以选择另一个元素内的所有元素:
````
*
{
background-color:yellow;
}
div *
{
background-color:yellow;
}
````

### element 选择器
选择指定元素名称的所有元素
````
p
{ 
    background-color:yellow;
}
````
### element element 选择器
用于选择元素内部的元素
````
div p
{
background-color:yellow;
}
````
### element>element 选择器
用于选择特定父元素,必须是直接父级元素
````
div>p
{
background-color:yellow;
}
````

### element+element 选择器
用于选择（不是内部）指定的第一个元素之后紧跟的元素
````
div+p
{ 
    background-color:yellow;
}
````

###  [attribute] 选择器
选择所有带有target属性的 <a>元素
````
a[target]
{
background-color:yellow;
}
````

### [attribute=value] 选择器
选择所有使用target="_blank"的a元素
````
a[target=_blank]
{
background-color:yellow;
}
````
### [attribute~=value] 选择器
于选择属性值包含一个指定单词的元素
````
[title~=flower]
{
background-color:yellow;
}
````

### [attribute|=value] 选择器
选择以指定值开头的属性值的元素。
````
[lang|=en]
{ 
    background-color:yellow;
}
````

常见伪类——:hover,:link,:active,:visited,:focus
### :link
选择所有未被访问的链接
```
a:link
{ 
background-color:yellow;
}
```
### :visited
选择所有已被访问的链接
```
a:visited
{ 
background-color:yellow;
}
```
### :active
用于选择活动链接,当您在一个链接上点击时，它就会成为活动的（激活的）
```
a:active
{ 
background-color:yellow;
}
```
### :hover        
选择鼠标指针浮动在其上的元素，并设置其样式：
```
<input type="text" name="firstname" />
a:hover
{ 
background-color:yellow;
}

a:link {color:#FF0000;}		/* 未被访问的链接 */
a:visited {color:#00FF00;}	/* 已被访问的链接 */
a:hover {color:#FF00FF;}	/* 鼠标指针移动到链接上 */
a:active {color:#0000FF;}	/* 正在被点击的链接 */

注意：
     a:hover 必须位于 a:link 和 a:visited 之后
     a:active 必须位于 a:hover 之后
```
### ::focus 选择器
选择器用于选取获得焦点的元素
```
input::focus
{ 
background-color:yellow;
}
```
常见伪元素——::first-letter,::first-line,::before,::after,::selection。
css3为了区分伪类和伪元素，伪元素采用双冒号写法。

注意：
::before和::after必须配合content属性来使用，content用来定义插入的内容，content必须有值，至少是空。
默认情况下，伪类元素的display是默认值inline，可以通过设置display:block来改变其显示。

### ::before 选择器
伪元素在元素之前添加内容。
伪元素用于向某些选择器设置特殊效果
```
h1::before
  {
  content:url(beep.wav);
  }
```
### ::after 选择器
伪元素在元素之后添加内容。
```
h1::after
  {
  content:url(beep.wav);
  }
```
### ::first-letter 选择器
用来指定元素第一个字母的样式
````
p:first-letter
{
font-size:200%;
color:#8A2BE2;
}
````
### ::first-child 选择器
选择器用于选取属于其父元素的首个子元素的指定选择器
```
p::first-child
{ 
background-color:yellow;
}
```
### :first-line 选择器
用来指定选择器第一行的样式
````
p:first-line
{
background-color:yellow;
}
````
### :lang 选择器
向带有指定 lang 属性开始的元素添加样式
````
p:lang(it)
{
background:yellow;
}
````

## css3选择器

### element1~element2 选择器
element1~element2 选择器匹配出现在 element1 后面的 element2
element1 和 element2 这两种元素必须具有相同的父元素，但 element2 不必紧跟在 element1 的后面
````
p~ul
{
background:#ff0000;
}
````
### [attribute^=value] 选择器
匹配元素属性值带指定的值开始的元素
````
div[class^="test"]
{
background:#ffff00;
}
````

### [attribute$=value] 选择器
匹配元素属性值带指定的值结尾的元素
````
div[class$="test"]
{
background:#ffff00;
}
````
### [attribute*=value] 选择器
匹配元素属性值包含指定值的元素
````
div[class*="test"]
{
    background:#ffff00;
}
````

### :first-of-type 选择器
匹配元素其父级是特定类型的第一个子元素
````
p:first-of-type
{
    background:#ff0000;
}
````

### :last-of-type 选择器
匹配元素其父级是特定类型的最后一个子元素
````
p:last-of-type
{
background:#ff0000;
}
````
### :only-of-type 选择器
代表了任意一个元素，这个元素没有其他相同类型的兄弟元素
````
p:only-of-type
{
    background:#ff0000;
}
````
### :only-child 选择器
匹配属于父元素中唯一子元素的元素
````
p:only-child
{
    background:#ff0000;
}
````
### :nth-child() 选择器
匹配父元素中的第 n 个子元素，元素类型没有限制
n 可以是一个数字，一个关键字，或者一个公式
````
p:nth-child(2)
{
    background:#ff0000;
}
````
### :nth-last-child() 选择器
匹配属于其元素的第 N 个子元素的每个元素，不论元素的类型，从最后一个子元素开始计数
````
p:nth-last-child(2)
{
    background:#ff0000;
}
````
### :nth-of-type() 选择器
匹配同类型中的第n个同级兄弟元素
````
p:nth-of-type(2)
{
background:#ff0000;
}
````
### :nth-last-of-type() 选择器
匹配同类型中的倒数第n个同级兄弟元素
````
p:nth-last-of-type(2)
{
background:#ff0000;
}
````
### :last-child 选择器
匹配父元素中最后一个子元素
````
p:last-child
{
background:#ff0000;
}
````
###  :root 选择器
用匹配文档的根元素
在HTML中根元素始终是HTML元素
````
:root
{
    background:#ff0000;
}
````
### :empty 选择器
选择每个没有任何子级的元素（包括文本节点）
````
p:empty
{
background:#ff0000;
}
````

### :target 选择器
＃ 锚的名称是在一个文件中链接到某个元素的URL。元素被链接到目标元素。
:target选择器可用于当前活动的target元素的样式
````
:target
{
border: 2px solid #D4D4D4;
background-color: #e5eecc;
}
````
### :enabled 选择器
匹配每个启用的的元素（主要用于表单元素）
### :disabled 选择器
匹配每个禁用的的元素（主要用于表单元素）
### :checked 选择器
匹配每个选中的输入元素（仅适用于单选按钮或复选框）
````
<input type="text" value="Mickey" />
<input type="text" disabled="disabled" value="Disneyland" />
input[type="text"]:enabled
{
	background:#ffff00;
}
input[type="text"]:disabled
{
	background:#dddddd;
}
````
### :not 选择器
匹配每个元素是不是指定的元素/选择器
````
:not(p)
{
background:#ff0000;
}
````
### ::selection 选择器
匹配元素中被用户选中或处于高亮状态的部分
只可以应用于少数的CSS属性：color, background, cursor,和outline

注意:
+ E9+, Opera, Google Chrome和Safari支持::selection选择器。
+ Firefox 通过其私有属性 ::-moz-selection 支持。
````
::selection
{
color:#ff0000;
}
::-moz-selection
{
color:#ff0000;
}
````

### :out-of-range 选择器
用于标签的值在指定区间之外时显示的样式
注意： :out-of-range 选择器只作用于能指定区间之外值的元素，例如 input 元素中的 min 和 max 属性
````
<input type="number" min="5" max="10" value="17" />

input:out-of-range
{
border:2px solid red;
}
````
### :in-range 选择器
用于标签的值在指定区间值时显示的样式
注意： :in-range 选择器只作用于能指定区间值的元素，例如 input 元素中的 min 和 max 属性
````
input:in-range
{
border:2px solid yellow;
}
````
### :read-write 选择器
用于匹配可读及可写的元素
+ 目前, 在大多浏览器中, :read-write 选择器只使用于设置了input 和 textarea 元素
````
<input readonly value="hello">
input:read-write
{
background-color: yellow;
}
````
### :read-only 选择器
用于选取设置了 "readonly" 属性的元素
````
input:read-only
{
background-color: yellow;
}
````
### :optional 选择器
在表单元素是可选项时设置指定样式
````
<input>
input:optional
{
background-color: yellow;
}
````
### :required 选择器
在表单元素是必填项时设置指定样式
````
input:required
{
background-color: yellow;
}
````
### :valid 选择器
在表单元素的值需要根据指定条件验证时设置指定样式
注意： :valid 选择器只作用于能指定区间值的元素，例如 input 元素中的 min 和 max 属性，及正确的 email 字段, 合法的数字字段等
````
<input type="email" value="support@exampel.com" />
input:valid
{
	background-color: yellow;
}
````
### :invalid 选择器
用于在表单元素中的值是非法时设置指定样式
注意： :invalid 选择器只作用于能指定区间值的元素，例如 input 元素中的 min 和 max 属性，及正确的 email 字段, 合法的数字字段等。
````
input:invalid
{
    border:2px solid red;
}
````
