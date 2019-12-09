## CSS背景  
CSS 允许应用纯色作为背景，也允许使用背景图像创建相当复杂的效果                   
### background           
简写属性在一个声明中设置所有的背景属性
语法：
````
body
{ 
    background: #00ff00 url('smiley.gif') no-repeat fixed center; 
}
````
### background-attachment 背景关联
规定背景图像是否固定或者随着页面的其余部分滚动
如果文档比较长，那么当文档向下滚动时，背景图像也会随之滚动。当文档滚动到超过图像的位置时，图像就会消失。
可选属性如下：
+ scroll 背景图片随着页面的滚动而滚动，这是默认的
+ fixed 背景图片不会随着页面的滚动而滚动
+ local 背景图片会随着元素内容的滚动而滚动
```
body 
  {
  background-image:url(/i/eg_bg_02.gif);
  background-repeat:no-repeat;
  background-attachment:fixed
  }
```
### background-color     
设置一个元素的背景颜色
可选属性如下：
+ color 指定背景颜色
+ transparent 指定背景颜色应该是透明的。这是默认
+ inherit 指定背景颜色，应该从父元素继承
```
p {background-color: gray;}
```
### background-image     
设置一个元素的背景图像
属性值
+ url('URL') 图像的URL
+ none 无图像显示，默认属性
+ linear-gradient() 创建一个线性渐变的 "图像"(从上到下)
+ radial-gradient() 用径向渐变创建 "图像"。 (从中心到边缘)
```
body {background-image: url(/i/eg_bg_04.gif);}
```
### background-position  
设置背景图像的起始位置
属性值
+ left top,left center,left bottom,right top,right center,right bottom,center top,center center,center bottom 如果仅指定一个关键字，其他字样是center
+ x% y% 第一个值是水平位置，第二个值是垂直。左上角是0％0％。右下角是100％100％。如果仅指定了一个值，其他值将是50％。默认值为：0％0％
```
p
  { 
    background-image:url('bgimg.gif');
    background-repeat:no-repeat;
    background-position:top;
  }
```
### background-repeat    
设置如何平铺对象的 background-image 属性
属性值
+ repeat 背景图像将向垂直和水平方向重复。这是默认
+ repeat-x 只有水平位置会重复背景图像
+ repeat-y 只有垂直位置会重复背景图像
+ no-repeat background-image不会重复
```
body
  { 
  background-image: url(/i/eg_bg_03.gif);
  background-repeat: repeat-y;
  }
```
### background-clip      
指定背景绘制区域
属性值
+ border-box 默认值。背景绘制在边框方框内（剪切成边框方框）
+ padding-box 背景绘制在衬距方框内（剪切成衬距方框）
+ content-box 背景绘制在内容方框内（剪切成内容方框）
````
div
{
    background-color:yellow;
    background-clip:content-box;
}
````
### background-origin    
指定background-position属性应该是相对位置
属性值
+ padding-box 背景图像填充框的相对位置
+ border-box 背景图像边界框的相对位置
+ content-box 背景图像的相对位置的内容框
### background-size      
指定背景图片大小
属性值
+ length 设置背景图片高度和宽度。第一个值设置宽度，第二个值设置的高度。如果只给出一个值，第二个是设置为 auto(自动)
+ percentage 将计算相对于背景定位区域的百分比。第一个值设置宽度，第二个值设置的高度。如果只给出一个值，第二个是设置为"auto(自动)"
+ cover 此时会保持图像的纵横比并将图像缩放成将完全覆盖背景定位区域的最小大小
+ contain 此时会保持图像的纵横比并将图像缩放成将适合背景定位区域的最大大小


