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

### flex-flow 属性
flex-flow 属性用于设置或检索弹性盒模型对象的子元素排列方式
- flex-flow 属性是 flex-direction 和 flex-wrap 属性的复合属性
- flex-direction 属性规定灵活项目的方向
- flex-wrap 属性规定灵活项目是否拆行或拆列
语法：flex-flow: flex-direction flex-wrap|initial|inherit;


### flex-direction 属性
规定灵活项目的方向
flex-direction: row|row-reverse|column|column-reverse|initial|inherit;

属性名
- row 默认值。灵活的项目将水平显示，正如一个行一样
- row-reverse 与 row 相同，但是以相反的顺序
- column 灵活的项目将垂直显示，正如一个列一样
- column-reverse 与 column 相同，但是以相反的顺序
````
div
{
display:flex;
flex-direction:row-reverse;
}
````

### flex-wrap 属性
规定flex容器是单行或者多行，同时横轴的方向决定了新行堆叠的方向
语法：flex-wrap: nowrap|wrap|wrap-reverse|initial|inherit;

属性值
- nowrap 默认值。规定灵活的项目不拆行或不拆列
- wrap 规定灵活的项目在必要的时候拆行或拆列
- wrap-reverse 规定灵活的项目在必要的时候拆行或拆列，但是以相反的顺序

````
div {
display:flex;
flex-wrap: wrap;
}
````

### align-content 属性
弹性容器内的各项没有占用交叉轴上所有可用的空间时对齐容器内的各项（垂直）

注意：容器内必须有多行的项目，该属性才能渲染出效果

语法：align-content: stretch|center|flex-start|flex-end|space-between|space-around|initial|inherit;

属性值：
- stretch 默认值。元素被拉伸以适应容器
- center 元素位于容器的中心
- flex-start 元素位于容器的开头
- flex-end 元素位于容器的结尾
- space-between 元素位于各行之间留有空白的容器内
- space-around 元素位于各行之前、之间、之后都留有空白的容器内
````
div
{
    display: flex;
    flex-flow: row wrap;
    align-content:space-around;
}
````

### align-items 属性
定义flex子项在flex容器的当前行的侧轴（纵轴）方向上的对齐方式
提示：使用每个弹性对象元素的 align-self 属性可重写 align-items 属性

语法：align-items: stretch|center|flex-start|flex-end|baseline|initial|inherit;

属性值

- stretch 默认值。元素被拉伸以适应容器。
- center 元素位于容器的中心
- flex-start 元素位于容器的开头
- flex-end 元素位于容器的结尾
- baseline 元素位于容器的基线上
````
div
{
    display: flex;
    align-items:center;
}
````

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

### justify-content 属性
用于设置或检索弹性盒子元素在主轴（横轴）方向上的对齐方式

语法：justify-content: flex-start|flex-end|center|space-between|space-around|initial|inherit;

属性值
- flex-start 默认值。项目位于容器的开头
- flex-end 项目位于容器的结尾
- center 项目位于容器的中心
- space-between 项目位于各行之间留有空白的容器内
- space-around 项目位于各行之前、之间、之后都留有空白的容器内

### order 属性
设置或检索弹性盒模型对象的子元素出现的順序
语法：order: number|initial|inherit;
````
div#myRedDIV {order:2;}
div#myBlueDIV {order:4;}
div#myGreenDIV {order:3;}
div#myPinkDIV {order:1;}
````