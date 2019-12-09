## CSS定位
### display     
属性规定元素应该生成的框的类型 

|值	|描述|
|---|---|
|none	|此元素不会被显示|
|block	|此元素将显示为块级元素，此元素前后会带有换行符|
|inline	|默认。此元素会被显示为内联元素，元素前后没有换行符|
|inline-block	|行内块元素。（CSS2.1 新增的值）|
|list-item	|此元素会作为列表显示|
|run-in	|此元素会根据上下文作为块级元素或内联元素显示|
|compact	|CSS 中有值 compact，不过由于缺乏广泛支持，已经从 CSS2.1 中删除。|
|marker	|CSS 中有值 marker，不过由于缺乏广泛支持，已经从 CSS2.1 中删除|
|table	|此元素会作为块级表格来显示（类似 table），表格前后带有换行符|
|inline-table	|此元素会作为内联表格来显示（类似 table），表格前后没有换行符。|
|table-row-group	|此元素会作为一个或多个行的分组来显示（类似 tbody）|
|table-header-group	|此元素会作为一个或多个行的分组来显示（类似 thead）|
|table-footer-group	|此元素会作为一个或多个行的分组来显示（类似 tfoot）|
|table-row	| 此元素会作为一个表格行显示（类似 tr）|
|table-column-group	|此元素会作为一个或多个列的分组来显示（类似 colgroup）|
|table-column	|此元素会作为一个单元格列显示（类似 col）|
|table-cell	|此元素会作为一个表格单元格显示（类似 td 和 th）|
|table-caption	|此元素会作为一个表格标题显示（类似 caption）|
|inherit	|规定应该从父元素继承 display 属性的值|

### position      
属性规定元素的定位类型
+ static 元素框正常生成。
+ absolute 元素框从文档流完全删除，并相对于其包含块定位，相对于它的包含块偏移
+ fixed 元素框的表现类似于将 position 设置为 absolute，相对于视图本身偏移
+ relative 元素框偏移某个距离。元素仍保持其未定位前的形状，相对于它本身的偏移
### z-index       
设置元素的堆叠顺序。拥有更高堆叠顺序的元素总是会处于堆叠顺序较低的元素的前面
数值越大，级别越高
```
img
  {
  position:absolute;
  left:0px;
  top:0px;
  z-index:-1;
  }
```
### opacity 
设置元素的不透明级别

|值	|描述	
|---|---|
|value	|规定不透明度。从 0.0 （完全透明）到 1.0（完全不透明）|
|inherit	|应该从父元素继承 opacity 属性的值|

```
div
{
opacity:0.5;
}
```
### left          
定义了定位元素左外边距边界与其包含块左边界之间的偏移
```
img
  {
  position:absolute;
  left:100px;
  }
```
### right         
定义了定位元素右外边距边界与其包含块右边界之间的偏移
```
img
  {
  position:absolute;
  right:5px;
  }
```
### top           
定义了一个定位元素的上外边距边界与其包含块上边界之间的偏移
```
img
  {
  position:absolute;
  top:5px;
  }
```
### bottom        
定义了定位元素下外边距边界与其包含块下边界之间的偏移
```
img
  {
  position:absolute;
  bottom:5px;
  }
```
## 相对定位

相对定位是一个非常容易掌握的概念。如果对一个元素进行相对定位，它将出现在它所在的位置上。
然后，可以通过设置垂直或水平位置，让这个元素“相对于”它的起点进行移动。

```
#box_relative {
  position: relative;
  left: 30px;
  top: 20px;
}
如果将 top 设置为 20px，那么框将在原位置顶部下面 20 像素的地方。
如果 left 设置为 30 像素，那么会在元素左边创建 30 像素的空间，也就是将元素向右移动。

注意：在使用相对定位时，无论是否进行移动，元素仍然占据原来的空间。因此，移动元素会导致它覆盖其它框。
```

## 绝对定位

设置为绝对定位的元素框从文档流完全删除，并相对于其包含块定位。
包含块可能是文档中的另一个元素或者是初始包含块。
元素原先在正常文档流中所占的空间会关闭，就好像该元素原来不存在一样。元素定位后生成一个块级框，
而不论原来它在正常流中生成何种类型的框。

```
#box_relative {
  position: absolute;
  left: 30px;
  top: 20px;
}
```
### float
定义元素在哪个方向浮动

|值	|描述|
|---|---|
|left	|元素向左浮动|
|right	|元素向右浮动|
|none	|默认值。元素不浮动，并会显示在其在文本中出现的位置|
|inherit	|规定应该从父元素继承 float 属性的值。|

### clear
规定元素的哪一侧不允许其他浮动元素

|值	|描述|
|---|---|
|left	|在左侧不允许浮动元素。|
|right	|在右侧不允许浮动元素。|
|both	|在左右两侧均不允许浮动元素。|
|none	|默认值。允许浮动元素出现在两侧。|
|inherit	|规定应该从父元素继承 clear 属性的值。|

### vertical-align
定义行内元素的基线相对于该元素所在行的基线的垂直对齐。允许指定负长度值和百分比值。
这会使元素降低而不是升高。在表单元格中，这个属性会设置单元格框中的单元格内容的对齐方式

|值	|描述|
|---|---|
|baseline	|默认。元素放置在父元素的基线上。|
|sub	|垂直对齐文本的下标。|
|super	|垂直对齐文本的上标|
|top	|把元素的顶端与行中最高元素的顶端对齐|
|text-top	|把元素的顶端与父元素字体的顶端对齐|
|middle	|把此元素放置在父元素的中部。|
|bottom	|把元素的顶端与行中最低的元素的顶端对齐。|
|text-bottom	|把元素的底端与父元素字体的底端对齐。|
|length	 ||
|%	|使用 "line-height" 属性的百分比值来排列此元素。允许使用负值。|
|inherit	|规定应该从父元素继承 vertical-align 属性的值。|

### visibility 
规定元素是否可见
指定是否显示一个元素生成的元素框。这意味着元素仍占据其本来的空间，不过可以完全不可见。
值 collapse 在表中用于从表布局中删除列或行

|值	|描述|
|---|---|
|visible	|默认值。元素是可见的。|
|hidden	|元素是不可见的。|
|collapse	|当在表格元素中使用时，此值可删除一行或一列，但是它不会影响表格的布局。被行或列占据的空间会留给其他内容使用。如果此值被用在其他的元素上，会呈现为 "hidden"。|
|inherit	|规定应该从父元素继承 visibility 属性的值。|

### min-width     
属性设置元素的最小宽度
### max-width     
定义元素的最大宽度
### max-height    
属性设置元素的最大高度
### min-height    
属性设置元素的最小高度
### overflow      
属性规定当内容溢出元素框时发生的事情  
+ visible 默认值。内容不会被修剪，会呈现在元素框之外
+ hidden 内容会被修剪，并且其余内容是不可见的
+ scroll 内容会被修剪，但是浏览器会显示滚动条以便查看其余的内容
+ auto 如果内容被修剪，则浏览器会显示滚动条以便查看其余的内容
+ inherit 规定应该从父元素继承 overflow 属性的值
### overflow-y 
属性规定是否对内容的上/下边缘进行裁剪 - 如果溢出元素内容区域的话
### overflow-x 
属性规定是否对内容的左/右边缘进行裁剪 - 如果溢出元素内容区域的话
### cursor        
属性规定要显示的光标的类型（形状）
+ pointer 光标呈现为指示链接的指针（一只手）
+ default 默认光标（通常是一个箭头）
### clip 
用于定义一个剪裁矩形。对于一个绝对定义元素，在这个矩形内的内容才可见。
出了这个剪裁区域的内容会根据 overflow 的值来处理

```
img
  {
  position:absolute;
  clip:rect(0px,60px,200px,0px);
  }
  shape	设置元素的形状。唯一合法的形状值是：rect (top, right, bottom, left)
```
### transform            
属性向元素应用 2D 或 3D 转换。该属性允许我们对元素进行旋转、缩放、移动或倾斜

```
div
{
transform:rotate(7deg);
-ms-transform:rotate(7deg); 	/* IE 9 */
-moz-transform:rotate(7deg); 	/* Firefox */
-webkit-transform:rotate(7deg); /* Safari 和 Chrome */
-o-transform:rotate(7deg); 	/* Opera */
}
```
### flex-shrink
flex-shrink 属性指定了 flex 元素的收缩规则。
flex 元素仅在默认宽度之和大于容器的时候才会发生收缩，其收缩的大小是依据 flex-shrink 的值。
注意：如果元素不是弹性盒对象的元素，则 flex-shrink 属性不起作用。
