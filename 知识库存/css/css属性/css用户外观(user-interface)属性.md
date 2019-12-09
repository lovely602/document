### appearance 属性
Firefox 支持替代的 -moz-appearance 属性。<br>
Safari 和 Chrome 支持替代的 -webkit-appearance 属性

允许您使元素看上去像标准的用户界面元素

语法：appearance: normal|icon|window|button|menu|field;

属性值
- normal	正常呈现元素
- icon	作为一个小图片的呈现元素
- window	作为一个视口呈现元素
- button	作为一个按钮，呈现元素
- menu	作为一个用户选项设定呈现元素选择
- field	作为一个输入字段呈现元素
````
div
{
appearance:button;
-moz-appearance:button; /* Firefox */
-webkit-appearance:button; /* Safari and Chrome */
}
````

### box-sizing 属性
允许你以某种方式定义某些元素，以适应指定区域

语法：box-sizing: content-box|border-box|inherit:

属性值：
- content-box 指定元素的宽度和高度（最小/最大属性）适用于box的宽度和高度。元素的填充和边框布局和绘制指定宽度和高度除外
- border-box 指定宽度和高度（最小/最大属性）确定元素边框。也就是说，对元素指定宽度和高度包括了 padding 和 border 。
             通过从已设定的宽度和高度分别减去边框和内边距才能得到内容的宽度和高度
- inherit	指定 box-sizing 属性的值，应该从父元素继承
````
div
{
        box-sizing:border-box;
        -moz-box-sizing:border-box; /* Firefox */
        width:50%;
        float:left;
}
````

### 指定一个元素是否是由用户调整大小的。

语法：resize: none|both|horizontal|vertical:

注意：resize属性适用于计算其他元素的溢出值是不是"visible"

属性值：
- none	用户无法调整元素的尺寸
- both	用户可调整元素的高度和宽度
- horizontal	用户可调整元素的宽度。
-  vertical	用户可调整元素的高度。
````
div
{
resize:both;
overflow:auto;
}
````