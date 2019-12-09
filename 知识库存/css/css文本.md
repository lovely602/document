## CSS文本
通过文本属性，您可以改变文本的颜色、字符间距，对齐文本，装饰文本，对文本进行缩进，等等

###  text-indent 
该属性可以方便地实现文本缩进
```
p {text-indent: 5em;}
```
### text-align    
属性规定元素中的文本的水平对齐方式
```
left、right 和 center justify
```
### word-spacing
设置字（单词）之间的标准间隔。其默认值 normal 与设置值为 0 是一样的
```
1em 等于当前的字体尺寸。
p.spread {word-spacing: 30px;}
p.tight {word-spacing: -0.5em}
```
### letter-spacing 
字母间隔修改的是字符或字母之间的间隔
```
h1 {letter-spacing: -0.5em}
h4 {letter-spacing: 20px}
```
### text-transform
处理文本的大小写
+ none 对文本不做任何改动
+ uppercase 转化为大写
+ lowercase 转化为小写
+ capitalize 只对每个单词的首字母大写
```
h1 {text-transform: uppercase}
```
###  text-decoration
文本装饰
none 不做操作
underline 对元素加下划线
overline 在文本的顶端画一个上划线
line-through 在文本中间画一个贯穿线
blink 让文本闪烁
```
a {text-decoration: none;}
```
### white-space
处理空白符，通过使用该属性，可以影响浏览器处理字之间和文本行之间的空白符的方式

|值|空白符|换行符|自动换行|
|---|---|---|---|
|pre-line|合并|保留|允许|
|normal|合并|忽略|允许|
|nowrap|合并|忽略|不允许|
|pre|保留|保留|不允许|
|pre-wrap|保留|保留|允许|
### color
指定文本的颜色
### direction
指定文本的方向
ltr 默认，文本方向从左到右
rtl 文本方向从右到左
### line-height   
属性设置行间的距离（行高）
normal 默认。设置合理的行间距
number 设置数字，此数字会与当前的字体尺寸相乘来设置行间距
length 设置固定的行间距
% 基于当前字体尺寸的百分比行间距
inherit 规定应该从父元素继承 line-height 属性的值
### word-wrap     
属性允许长单词或 URL 地址换行到下一行。normal|break-word

### font-family
```
p {font-family: Times, TimesNR, 'New Century Schoolbook',
     Georgia, 'New York', serif;}
```
### font-style
最常用于规定斜体文本
+ normal - 文本正常显示
+ italic - 文本斜体显示
+ oblique - 文本倾斜显示
```
p.normal {font-style:normal;}
p.italic {font-style:italic;}
p.oblique {font-style:oblique;}
```
### font-weight   
设置文本的粗细。normal|bold|bolder|lighter
### font-size     
属性可设置字体的尺寸
### text-overflow 
- clip 修剪文本
- ellipsis 显示省略符号来代表被修剪的文本
- string 使用给定的字符串来代表被修剪的文本
### user-select   
设置或检索是否允许用户选中文本