### color 属性
指定文本的颜色

属性值：
+ color_name	规定颜色值为颜色名称的颜色（比如 red）
+ hex_number	规定颜色值为十六进制值的颜色（比如 #ff0000）
+ rgb_number	规定颜色值为 rgb 代码的颜色（比如 rgb(255,0,0)）
````
color:red;
color:#00ff00;
color:rgb(0,0,255);
````
### direction 属性
指定文本方向/书写方向
属性值：
+ ltr	默认。文本方向从左到右
+ rtl	文本方向从右到左
````
div{
    direction:rtl;
    unicode-bidi: bidi-override;
}
````
### letter-spacing 属性
增加或减少字符间的空白（字符间距）
属性值
+ normal	默认。规定字符间没有额外的空间
+ length	定义字符间的固定空间（允许使用负值）
````
h1 {letter-spacing:2px}
h2 {letter-spacing:-3px}
````
### line-height 属性
设置以百分比计的行高
注意： 负值是不允许的

属性值
+ normal	默认。设置合理的行间距
+ number	设置数字，此数字会与当前的字体尺寸相乘来设置行间距
+ length	设置固定的行间距
+ %	基于当前字体尺寸的百分比行间距
````
p.small {line-height:90%}
p.big {line-height:200%}
````

### text-align 属性
指定元素文本的水平对齐方式

属性值
+ left	把文本排列到左边。默认值：由浏览器决定
+ right	把文本排列到右边
+ center	把文本排列到中间
+ justify	实现两端对齐文本效果
````
h1 {text-align:center}
h2 {text-align:left}
h3 {text-align:right}
````
### text-align-last 属性
规定如何对齐文本的最后一行
语法：text-align-last: auto|left|right|center|justify|start|end|initial|inherit;

属性值：
- auto	默认值。最后一行被调整，并向左对齐
- left	最后一行向左对齐
- right	最后一行向右对齐
- center	最后一行居中对齐
- justify	最后一行被调整为两端对齐
- start	最后一行在行开头对齐
- end	最后一行在行末尾对齐

### text-decoration 属性
规定添加到文本的修饰，下划线、上划线、删除线等
text-decoration 属性是以下三种属性的简写：
- text-decoration-line
- text-decoration-color
- text-decoration-style

属性值
+ none	默认。定义标准的文本
+ underline	定义文本下的一条线
+ overline	定义文本上的一条线
+ line-through	定义穿过文本下的一条线
+ blink	定义闪烁的文本

````
h1 {text-decoration:overline}
h2 {text-decoration:line-through}
h3 {text-decoration:underline}
````

### text-indent 属性
规定文本块中首行文本的缩进
属性值
- length	定义固定的缩进。默认值：0
- %	定义基于父元素宽度的百分比的缩进
````
p
{
text-indent:50px;
}
````

### text-transform 属性
控制文本的大小写
属性值
- none	默认。定义带有小写字母和大写字母的标准的文本
- capitalize	文本中的每个单词以大写字母开头
- uppercase	定义仅有大写字母
- lowercase	定义无大写字母，仅有小写字母
````
h1 {text-transform:uppercase;}
h2 {text-transform:capitalize;}
p {text-transform:lowercase;}
````

### vertical-align 属性
设置一个元素的垂直对齐方式

该属性定义行内元素的基线相对于该元素所在行的基线的垂直对齐。允许指定负长度值和百分比值。
这会使元素降低而不是升高。在表单元格中，这个属性会设置单元格框中的单元格内容的对齐方式

属性值
+ baseline	默认。元素放置在父元素的基线上
+ sub	垂直对齐文本的下标
+ super	垂直对齐文本的上标
+ top	把元素的顶端与行中最高元素的顶端对齐
+ text-top	把元素的顶端与父元素字体的顶端对齐
+ middle	把此元素放置在父元素的中部
+ bottom	把元素的底端与行中最低的元素的顶端对齐
+ text-bottom	把元素的底端与父元素字体的底端对齐

### white-space 属性
指定元素内的空白怎样处理
属性值
- normal	默认。空白会被浏览器忽略
- pre	空白会被浏览器保留。其行为方式类似 HTML 中的 pre 标签
- nowrap	文本不会换行，文本会在在同一行上继续，直到遇到 br 标签为止
- pre-wrap	保留空白符序列，但是正常地进行换行
- pre-line	合并空白符序列，但是保留换行符

````
p
{
    white-space:nowrap;
}
````
### word-spacing 属性
增加或减少字与字之间的空白

属性值
- normal	默认。定义单词间的标准空间
- length	定义单词间的固定空间
````
p
{
word-spacing:30px;
}
````
### text-overflow 属性
指定当文本溢出包含它的元素，应该发生什么
语法：text-overflow: clip|ellipsis|string;
 属性值
 - clip	修剪文本
 - ellipsis	显示省略符号来代表被修剪的文本
 - string	使用给定的字符串来代表被修剪的文本
 ````
div.test
{
text-overflow:ellipsis;
}
 ````
 
 ### text-shadow 属性
 应用于阴影文本
 语法：text-shadow: h-shadow v-shadow blur color;
 
 属性值：
 - h-shadow	必需。水平阴影的位置。允许负值
 - v-shadow	必需。垂直阴影的位置。允许负值
 - blur	可选。模糊的距离
 - color	可选。阴影的颜色
 
 ````
 h1
 {
     text-shadow: 2px 2px #ff0000;
 }
 ````
 
 ### word-break 属性
 指定非CJK脚本的断行规则
 
 语法：word-break: normal|break-all|keep-all;
 
 属性值：
 - normal	使用浏览器默认的换行规则
 - break-all	允许在单词内换行
 - keep-all	只能在半角空格或连字符处换行
 ````
 p.test {word-break:break-all;}
 ````