### list-style 属性
简写属性在一个声明中设置所有的列表属性

可以设置的属性（按顺序）： list-style-type, list-style-position, list-style-image

属性值
- list-style-type 设置列表项标记的类型
- list-style-position 设置在何处放置列表项标记
- list-style-image 使用图像来替换列表项的标记
````
ul
{
    list-style:square url("sqpurple.gif");
}
````
### list-style-type 属性
设置列表项标记的类型

属性值
- none 无标记
- dist 默认。标记是实心圆
- circle 标记是空心圆
- square 标记是实心方块
- decimal 标记是数字
- decimal-leading-zero 0开头的数字标记。(01, 02, 03, 等。)
- lower-roman 小写罗马数字(i, ii, iii, iv, v, 等。)
- upper-roman 大写罗马数字(I, II, III, IV, V, 等。)
- lower-alpha 小写英文字母The marker is lower-alpha (a, b, c, d, e, 等。)
- upper-alpha 大写英文字母The marker is upper-alpha (A, B, C, D, E, 等。)
- lower-greek 小写希腊字母(alpha, beta, gamma, 等。)
- lower-latin 小写拉丁字母(a, b, c, d, e, 等。)
- upper-latin 大写拉丁字母(A, B, C, D, E, 等。)
- cjk-ideographic 简单的表意数字

### list-style-position 属性
指示如何相对于对象的内容绘制列表项标记

属性值
- inside 列表项目标记放置在文本以内，且环绕文本根据标记对齐
- outside 默认值。保持标记位于文本的左侧。列表项目标记放置在文本以外，且环绕文本不根据标记对齐
````
ul {
    list-style-position: inside;
}
````

### list-style-image 属性
使用图像来替换列表项的标记

属性值
- url 图像的路径
- none 默认。无图形被显示
- inherit 规定应该从父元素继承 list-style-image 属性的值