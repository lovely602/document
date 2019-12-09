### columns 属性
指定列的宽度和数量

语法：columns: column-width column-count;

属性值：
- column-width	列的宽度
- column-count	列数
````
div
{
        columns:100px 3;
        -webkit-columns:100px 3; /* Safari and Chrome */
        -moz-columns:100px 3; /* Firefox */
}
````

### column-width 属性
指定列的宽度

语法：column-width: auto|length;

注意：当自定列的宽度发生变化后，列的数量也随之变化

属性值：
- auto	浏览器将决定列的宽度
- length	指定列宽的长度
````
div
{
column-width:100px;
-moz-column-width:100px; /* Firefox */
-webkit-column-width:100px; /* Safari and Chrome */
}
````

### column-count 属性
指定某个元素应分为的列数

语法：column-count: number|auto;

属性值：
- number	列的最佳数目将其中的元素的内容无法流出
- auto	列数将取决于其他属性，例如："column-width"
````
div
{
column-count:3;
-moz-column-count:3; /* Firefox */
-webkit-column-count:3; /* Safari and Chrome */
}
````
注意：高版本google浏览器已兼容column-count属性，直接使用column-count即可

### column-gap 属性
指定的列之间的差距

语法：column-gap: length|normal;

属性值：
- length	一个指定的长度，将设置列之间的差距
- normal	指定一个列之间的普通差距。 W3C建议1EM值
````
div
{
column-gap:40px;
-moz-column-gap:40px; /* Firefox */
-webkit-column-gap:40px; /* Safari and Chrome */
}
````

### column-span 属性
指定某个元素应该跨越多少列

语法：column-span: 1|all;

属性值：
- 1	元素应跨越一列
- all	该元素应该跨越所有列
````
h2
{
column-span:all;
-webkit-column-span:all; /* Safari and Chrome */
}
````

### column-rule 属性
column-rule属性设置列之间的宽度，样式和颜色

语法：column-rule: column-rule-width column-rule-style column-rule-color;
- column-rule-width	设置列中之间的宽度规则
- column-rule-style	设置列中之间的样式规则
- column-rule-color	设置列中之间的颜色规则

````
div
{
column-rule:3px outset #ff00ff;
-moz-column-rule:3px outset #ff00ff; /* Firefox */
-webkit-column-rule:3px outset #ff00ff; /* Safari and Chrome */
}
````

### column-rule-width 属性
指定列之间的宽度规则

语法：column-rule-width: thin|medium|thick|length;

属性值：
- thin	指定一个细边框的规则
- medium	定义一个中等边框规则
- thick	指定一个粗边框的规则
- length	指定宽度的规则
````
div {
    -webkit-column-rule-width: 1px; /* Chrome, Safari, Opera */
    -moz-column-rule-width: 1px; /* Firefox */
    column-rule-width: 1px;
}
````

### column-rule-style 属性
指定列之间的样式规则

语法：column-rule-style: none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset;

属性值：
- none	定义没有规则。
- hidden	定义隐藏规则。
- dotted	定义点状规则。
- dashed	定义虚线规则
- solid	定义实线规则。
- double	定义双线规则。
- groove	定义 3D grooved 规则。该效果取决于宽度和颜色值
- ridge	定义 3D ridged 规则。该效果取决于宽度和颜色值。
- outset	定义 3D outset 规则。该效果取决于宽度和颜色值。
- inset	定义 3D inset 规则。该效果取决于宽度和颜色值。

````
div
{
column-rule-style:dotted;
-moz-column-rule-style:dotted; /* Firefox */
-webkit-column-rule-style:dotted; /* Safari and Chrome */
}
````

### column-rule-color 属性
指定列之间的颜色规则

语法：column-rule-color: color;

属性值：
- color	指定颜色的规则
````
div
{
column-rule-color:#ff0000;
-moz-column-rule-color:#ff0000; /* Firefox */
-webkit-column-rule-color:#ff0000; /* Safari and Chrome */
}
````