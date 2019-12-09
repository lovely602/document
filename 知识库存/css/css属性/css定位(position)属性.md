# css定位

### display 属性
规定元素应该生成的框的类型

属性值
- none	此元素不会被显示
- flex 此元素将作为弹性容器展示
- block	此元素将显示为块级元素，此元素前后会带有换行符
- inline	默认。此元素会被显示为内联元素，元素前后没有换行符
- inline-block	行内块元素
- list-item	此元素会作为列表显示
- table	此元素会作为块级表格来显示（类似 <table>），表格前后带有换行符
- inline-table	此元素会作为内联表格来显示（类似 <table>），表格前后没有换行符
- table-cell	此元素会作为一个表格单元格显示（类似 <td> 和 <th>）
````
p.inline
{
    display:inline;
}
````
### position 属性
指定一个元素（静态的，相对的，绝对或固定）的定位方法的类型

属性值
- absolute 生成绝对定位的元素，相对于 static 定位以外的第一个父元素进行定位。
           元素的位置通过 "left", "top", "right" 以及 "bottom" 属性进行规定。
- fixed  	生成固定定位的元素，相对于浏览器窗口进行定位。
            元素的位置通过 "left", "top", "right" 以及 "bottom" 属性进行规定。
- relative  生成相对定位的元素，相对于其正常位置进行定位。
            因此，"left:20" 会向元素的 LEFT 位置添加 20 像素。
- static	默认值。没有定位，元素出现在正常的流中（忽略 top, bottom, left, right 或者 z-index 声明）

### bottom 属性
对于绝对定位元素，bottom属性设置单位高于/低于包含它的元素的底边

对于相对定位元素，bottom属性设置单位高于/低于其正常位置的元素的底边

属性值
- auto	默认值。通过浏览器计算底部的位置。
- %	设置以包含元素的百分比计的底边位置。可使用负值
- length	使用 px、cm 等单位设置元素的底边位置。可使用负值
- inherit	规定应该从父元素继承 bottom 属性的值
````
img
{
position:absolute;
bottom:5px;
}
````
### top 属性
定义了一个定位元素的上外边距边界与其包含块上边界之间的偏移
````
img
{
position:absolute;
top:5px;
}
````

### left 属性
定义了定位元素左外边距边界与其包含块左边界之间的偏移
````
img
{
position:absolute;
left:5px;
}
````

### right 属性
定义了定位元素右外边距边界与其包含块右边界之间的偏移
````
img
{
position:absolute;
right:5px;
}
````
### float 属性
指定一个盒子（元素）是否应该浮动

注意： 绝对定位的元素忽略float属性！

属性值
- left	元素向左浮动。
- right	元素向右浮动
- none	默认值。元素不浮动，并会显示在其在文本中出现的位置
````
img
{
float:right;
}
````
### clear 属性
指定段落的左侧或右侧不允许浮动的元素。

属性值
- left	在左侧不允许浮动元素
- right	在右侧不允许浮动元素
- both	在左右两侧均不允许浮动元素
- none	默认值。允许浮动元素出现在两侧

### clip 属性
clip属性，让你指定一个绝对定位的元素，该尺寸应该是可见的
注意：如果先有"overflow：visible"，clip属性不起作用

属性值
- shape	设置元素的形状。唯一合法的形状值是：rect (top, right, bottom, left)
- auto	默认值。不应用任何剪裁
````
img
{
position:absolute;
clip:rect(0px,60px,200px,0px);
}
````

### cursor 属性
定义了鼠标指针放在一个元素边界范围内时所用的光标形状

属性值
- url 需使用的自定义光标的 URL
- default	默认光标（通常是一个箭头）
- auto	默认。浏览器设置的光标
- crosshair	光标呈现为十字线
- pointer	光标呈现为指示链接的指针（一只手）
- move	此光标指示某对象可被移动
- e-resize	此光标指示矩形框的边缘可被向右（东）移动
- ne-resize	此光标指示矩形框的边缘可被向上及向右移动（北/东）
- nw-resize	此光标指示矩形框的边缘可被向上及向左移动（北/西）
- n-resize	此光标指示矩形框的边缘可被向上（北）移动
- se-resize	此光标指示矩形框的边缘可被向下及向右移动（南/东）
- sw-resize	此光标指示矩形框的边缘可被向下及向左移动（南/西）
- s-resize	此光标指示矩形框的边缘可被向下移动（北/西）
- w-resize	此光标指示矩形框的边缘可被向左移动（西）
- text	此光标指示文本
- wait	此光标指示程序正忙（通常是一只表或沙漏）
- help	此光标指示可用的帮助（通常是一个问号或一个气球）
````
span.crosshair {cursor:crosshair}
span.help {cursor:help}
span.wait {cursor:wait}
````

### overflow 属性
指定如果内容溢出一个元素的框，会发生什么

属性值
- visible	默认值。内容不会被修剪，会呈现在元素框之外
- hidden	内容会被修剪，并且其余内容是不可见的
- scroll	内容会被修剪，但是浏览器会显示滚动条以便查看其余的内容
- auto	如果内容被修剪，则浏览器会显示滚动条以便查看其余的内容
````
div.ex1 {
    overflow: scroll;
}
 
````

### visibility 属性
指定一个元素是否是可见的

属性值
- visible	默认值。元素是可见的
- hidden	元素是不可见的
````
h2
{
visibility:hidden;
}
````

### z-index 属性
指定一个元素的堆叠顺序

拥有更高堆叠顺序的元素总是会处于堆叠顺序较低的元素的前面

属性值
- auto	默认。堆叠顺序与父元素相等
- number	设置元素的堆叠顺序
````
img
{
    position:absolute;
    left:0px;
    top:0px;
    z-index:-1;
}
````