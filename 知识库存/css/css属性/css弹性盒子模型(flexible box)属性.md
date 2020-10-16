### flex布局 
http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html

## Flex 布局是什么
Flex 是 Flexible Box 的缩写，意为"弹性布局"，用来为盒状模型提供最大的灵活性

任何一个容器都可以指定为 Flex 布局
````
.box{
  display: flex;
}
````
行内元素也可以使用 Flex 布局
````
.box{
  display: inline-flex;
}
````

## 基本概念

采用 Flex 布局的元素，称为 Flex 容器（flex container），简称"容器"。
它的所有子元素自动成为容器成员，称为 Flex 项目（flex item），简称"项目"

容器默认存在两根轴：水平的主轴（main axis）和垂直的交叉轴（cross axis）。
主轴的开始位置（与边框的交叉点）叫做main start，结束位置叫做main end；交叉轴的开始位置叫做cross start，结束位置叫做cross end

项目默认沿主轴排列。单个项目占据的主轴空间叫做main size，占据的交叉轴空间叫做cross size

## 容器的属性

### flex-direction属性

flex-direction属性决定主轴的方向（即项目的排列方向）
````
.box {
  flex-direction: row | row-reverse | column | column-reverse;
}
````
- row（默认值）：主轴为水平方向，起点在左端。
- row-reverse：主轴为水平方向，起点在右端。
- column：主轴为垂直方向，起点在上沿。
- column-reverse：主轴为垂直方向，起点在下沿。

### flex-wrap属性

默认情况下，项目都排在一条线（又称"轴线"）上。flex-wrap属性定义，如果一条轴线排不下，如何换行
````
.box{
  flex-wrap: nowrap | wrap | wrap-reverse;
}
````
- nowrap（默认）：不换行。
- wrap：换行，第一行在上方
- wrap-reverse：换行，第一行在下方

### flex-flow
flex-flow属性是flex-direction属性和flex-wrap属性的简写形式，默认值为row nowrap
````
.box {
  flex-flow: <flex-direction> || <flex-wrap>;
}
````

### justify-content

justify-content属性定义了项目在主轴上的对齐方式
````
.box {
  justify-content: flex-start | flex-end | center | space-between | space-around;
}
````

- flex-start（默认值）：左对齐
- flex-end：右对齐
- center： 居中
- space-between：两端对齐，项目之间的间隔都相等
- space-around：每个项目两侧的间隔相等。所以，项目之间的间隔比项目与边框的间隔大一倍

### align-items属性

align-items属性定义项目在交叉轴上如何对齐
````
.box {
  align-items: flex-start | flex-end | center | baseline | stretch;
}
````
- flex-start：交叉轴的起点对齐
- flex-end：交叉轴的终点对齐
- center：交叉轴的中点对齐
- baseline: 项目的第一行文字的基线对齐
- stretch（默认值）：如果项目未设置高度或设为auto，将占满整个容器的高度

### align-content属性
align-content属性定义了多根轴线的对齐方式。如果项目只有一根轴线，该属性不起作用
````
flex-start：与交叉轴的起点对齐
flex-end：与交叉轴的终点对齐
center：与交叉轴的中点对齐
space-between：与交叉轴两端对齐，轴线之间的间隔平均分布
space-around：每根轴线两侧的间隔都相等。所以，轴线之间的间隔比轴线与边框的间隔大一倍
stretch（默认值）：轴线占满整个交叉轴
````

## 项目的属性

### order属性

order属性定义项目的排列顺序。数值越小，排列越靠前，默认为0
````
.item {
  order: <integer>;
}
````

### flex-grow 属性
用于设置或检索弹性盒子的扩展比率
注意：如果元素不是弹性盒对象的元素，则 flex-grow 属性不起作用

语法：flex-grow: number|initial|inherit;
属性值
+ number 一个数字，规定项目将相对于其他灵活的项目进行扩展的量。默认值是 0
+ initial 设置该属性为它的默认值
+ inherit 从父元素继承该属性
````
div:nth-of-type(1) {flex-grow: 1;}
div:nth-of-type(2) {flex-grow: 3;}
div:nth-of-type(3) {flex-grow: 1;}
````
### flex-shrink 属性
指定了 flex 元素的收缩规则。flex 元素仅在默认宽度之和大于容器的时候才会发生收缩，其收缩的大小是依据 flex-shrink 的值
注意：如果元素不是弹性盒对象的元素，则 flex-shrink 属性不起作用
````
.box { 
  flex-shrink: 1;
}
````

### flex-basis 属性
用于设置或检索弹性盒伸缩基准值
语法：flex-basis: number|auto|initial|inherit;

属性值
- number 一个长度单位或者一个百分比，规定灵活项目的初始长度
- auto 默认值。长度等于灵活项目的长度。如果该项目未指定长度，则长度将根据内容决定
- initial 设置该属性为它的默认值
- inherit 从父元素继承该属性
````
div:nth-of-type(2) {flex-basis: 80px;}
````
### flex 属性
用于设置或检索弹性盒模型对象的子元素如何分配空间

flex 属性是 flex-grow、flex-shrink 和 flex-basis 属性的简写属性
- 语法：flex: flex-grow flex-shrink flex-basis|auto|initial|inherit;

属性值
+ flex-grow 一个数字，规定项目将相对于其他灵活的项目进行扩展的量
+ flex-shrink 一个数字，规定项目将相对于其他灵活的项目进行收缩的量
+ flex-basis 项目的长度。合法值："auto"、"inherit" 或一个后跟 "%"、"px"、"em" 或任何其他长度单位的数字
+ auto 与 1 1 auto 相同
+ none 与 0 0 auto 相同
+ initial 设置该属性为它的默认值，即为 0 1 auto

### align-self 属性
定义flex子项单独在侧轴（纵轴）方向上的对齐方式

语法：align-self: auto|stretch|center|flex-start|flex-end|baseline|initial|inherit;

属性值
- auto 默认值。元素继承了它的父容器的 align-items 属性。如果没有父容器则为 "stretch"
- stretch 元素被拉伸以适应容器
- center 元素位于容器的中心
- flex-start 元素位于容器的开头
- flex-end 元素位于容器的结尾
- baseline 元素位于容器的基线上