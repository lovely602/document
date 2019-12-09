# css边框和轮廓

### border 属性
缩写边框属性设置在一个声明中所有的边框属性，可以设置的属性分别（按顺序）：border-width, border-style,和border-color.
属性值：border-width,border-style,border-color
````
p
{
border:5px solid red;
}
````
### border-width 属性
border-width属性设置一个元素的四个边框的宽度。此属性可以有一到四个值
属性值
- thin 定义细的边框
- medium 默认。定义中等的边框
- thick 定义粗的边框
- length 允许您自定义边框的宽度
````
border-width:thin medium thick 10px;
border-width:thin medium thick;
border-width:thin medium;
border-width:thin;
````
### border-style 属性
设置一个元素的四个边框的样式。此属性可以有一到四个值
属性值
- none 定义无边框
- hidden 与 "none" 相同。不过应用于表时除外，对于表，hidden 用于解决边框冲突
- dotted 定义点状边框。在大多数浏览器中呈现为实线
- dashed 定义虚线。在大多数浏览器中呈现为实线
- solid 定义实线
- double 定义双线。双线的宽度等于 border-width 的值
- groove 定义 3D 凹槽边框。其效果取决于 border-color 的值
- ridge 定义 3D 垄状边框。其效果取决于 border-color 的值
- inset 定义 3D inset 边框。其效果取决于 border-color 的值
- outset 定义 3D outset 边框。其效果取决于 border-color 的值
````
border-style:dotted solid double dashed;
border-style:dotted solid double;
border-style:dotted solid;
border-style:dotted;
````
### border-color 属性
设置一个元素的四个边框颜色。此属性可以有一到四个值
属性值
+ color  指定背景颜色。
+ transparent 指定边框的颜色应该是透明的。这是默认
+ inherit 指定边框的颜色，应该从父元素继承
````
p
{
border-style:solid;
border-color:#ff0000 #0000ff;
}
````
### border-top 属性 
简写属性把上边框的所有属性设置到一个声明中
### border-top-width 
设置或检索对象的顶部边框宽度。
### border-top-style
设置或检索对象的顶部边框样式
### border-top-color
设置或检索对象的顶部边框颜色
### border-right 属性
简写属性把右边框的所有属性设置到一个声明中,属性类似border-top
### border-bottom 属性
简写属性把下边框的所有属性设置到一个声明中,属性类似border-top
### border-left 属性
简写属性把左边框的所有属性设置到一个声明中,属性类似border-top

### outline 属性
绘制于元素周围的一条线，位于边框边缘的外围，可起到突出元素的作用

可以设置的属性分别是（按顺序）：outline-color, outline-style, outline-width
````
p
{
outline:#00FF00 dotted thick;
}
````
### outline-color 属性
指定轮廓颜色
注意：请始终在 outline-color 属性之前声明 outline-style 属性。元素只有获得轮廓以后才能改变其轮廓的颜色
属性值
+ color 指定轮廓颜色
+ invert 默认。执行颜色反转（逆向的颜色）。可使轮廓在不同的背景颜色中都是可见
+ inherit 规定应该从父元素继承轮廓颜色的设置
````
p
{
outline-style:dotted;
outline-color:#00ff00;
}
````
### outline-style 属性
指定outline的样式,
属性值类似border-style
### outline-width 属性
指定轮廓的宽度
注意： 请始终在outline-width属性之前声明outline-style属性。元素只有获得轮廓以后才能改变其轮廓的宽度。
属性值类似border-width

### outline-offset 属性
设置轮廓框架在 border 边缘外的偏移

语法：outline-offset: length|inherit:

属性值
- length	轮廓与边框边缘的距离。
- inherit 规定应从父元素继承 outline-offset 属性的值。
````
div
{
border:2px solid black;
outline:2px solid red;
outline-offset:15px;
}
````

### border-image 属性
指定元素周围边框的图像
+ 语法：border-image: source slice width outset repeat|initial|inherit;
属性值
+ border-image-source 用于指定要用于绘制边框的图像的位置
+ border-image-slice 图像边界向内偏移
+ border-image-width 图像边界的宽度
+ border-image-outset 用于指定在边框外部绘制 border-image-area 的量
+ border-image-repeat 用于设置图像边界是否应重复（repeat）、拉伸（stretch）或铺满（round）
````
#borderimg { 
    -webkit-border-image: url(border.png) 30 round; /* Safari 3.1-5 */
    -o-border-image: url(border.png) 30 round; /* Opera 11-12.1 */
    border-image: url(border.png) 30 round;
}
````
### border-image-source 属性
指定要使用的图像，而不是由border-style属性设置的边框样式
属性值
+ none 没有图像被使用
+ url 图像的地址

### border-image-slice 属性
指定图像的边界向内偏移
语法：border-image-slice: number|%|fill;
+ number 数字表示图像的像素（位图图像）或向量的坐标（如果图像是矢量图像）
+ % 百分比图像的大小是相对的：水平偏移图像的宽度，垂直偏移图像的高度
+ fill 保留图像的中间部分

### border-image-width 属性
指定图像边界的宽度
语法：border-image-width: number|%|auto;
属性值
+ number 表示相应的border-width 的倍数
+ % 边界图像区域的大小：横向偏移的宽度的面积，垂直偏移的高度的面积
+ auto 如果指定了，宽度是相应的image slice的内在宽度或高度
````
div
{
    border-image-source: url(border.png);
    border-image-width: 30 30;
}
````
### border-image-outset 属性
指定在边框外部绘制 border-image-area 的量
语法：border-image-outset: length|number;
属性值
+ length 设置边框图像与边框（border-image）的距离，默认为0
+ number 代表相应的 border-width 的倍数
````
div
{
    border-image-source: url(border.png);
    border-image-outset: 30 30;
}
````
### border-image-repeat 属性
用于图像边界是否应重复（repeated）、拉伸（stretched）或铺满（rounded）
语法：border-image-repeat: stretch|repeat|round|initial|inherit;
属性值
+ stretch 默认值。拉伸图像来填充区域
+ repeat 平铺（repeated）图像来填充区域
+ round 类似 repeat 值。如果无法完整平铺所有图像，则对图像进行缩放以适应区域
+ space 类似 repeat 值。如果无法完整平铺所有图像，扩展空间会分布在图像周围
+ initial 将此属性设置为默认值
+ inherit 从父元素中继承该属性
````
div {
    border-image-source: url(border.png);
    border-image-repeat: repeat;
}
````

### border-radius 属性
最多可指定四个 border -*- radius 属性的复合属性
相关子属性如下：
- border-top-left-radius
- border-top-right-radius
- border-bottom-right-radius
- border-bottom-left-radius

属性值
+ length 定义弯道的形状
+ % 使用%定义角落的形状
````
div
{
    border:2px solid;
    border-radius:25px;
}
````
### box-shadow 属性
设置一个或多个下拉阴影的框

- 语法：box-shadow: h-shadow v-shadow blur spread color inset;
属性值
+ h-shadow 必需的。水平阴影的位置。允许负值
+ v-shadow 必需的。垂直阴影的位置。允许负值
+ blur 可选。模糊距离
+ spread 可选。阴影的大小
+ color 可选。阴影的颜色
+ inset 可选。从外层的阴影（开始时）改变阴影内侧阴影
````
div
{
    box-shadow: 10px 10px 5px #888888;
}
````

