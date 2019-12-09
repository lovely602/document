### transform 属性
应用于元素的2D或3D转换。这个属性允许你将元素旋转，缩放，移动，倾斜等

语法：transform: none|transform-functions;

属性值：
- none	定义不进行转换
- matrix(n,n,n,n,n,n)	定义 2D 转换，使用六个值的矩阵
- matrix3d(n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n)	定义 3D 转换，使用 16 个值的 4x4 矩阵
- translate(x,y)	定义 2D 转换
- translate3d(x,y,z)	定义 3D 转换
- translateX(x)	定义转换，只是用 X 轴的值
- translateY(y)	定义转换，只是用 Y 轴的值
- translateZ(z)	定义 3D 转换，只是用 Z 轴的值
- scale(x[,y]?)	定义 2D 缩放转换
- scale3d(x,y,z)	定义 3D 缩放转换
- scaleX(x)	通过设置 X 轴的值来定义缩放转换
- scaleY(y)	通过设置 Y 轴的值来定义缩放转换
- scaleZ(z)	通过设置 Z 轴的值来定义 3D 缩放转换
- rotate(angle)	定义 2D 旋转，在参数中规定角度
- rotate3d(x,y,z,angle)	定义 3D 旋转
- rotateX(angle)	定义沿着 X 轴的 3D 旋转
- rotateY(angle)	定义沿着 Y 轴的 3D 旋转
- rotateZ(angle)	定义沿着 Z 轴的 3D 旋转
- skew(x-angle,y-angle)	定义沿着 X 和 Y 轴的 2D 倾斜转换
- skewX(angle)	定义沿着 X 轴的 2D 倾斜转换
- skewY(angle)	定义沿着 Y 轴的 2D 倾斜转换
- perspective(n)	为 3D 转换元素定义透视视图
````
div
{
    transform:rotate(7deg);
    -ms-transform:rotate(7deg); /* IE 9 */
    -webkit-transform:rotate(7deg); /* Safari and Chrome */
}
````

### transform-origin 属性
允许您更改转换元素的位置

2D转换元素可以改变元素的X和Y轴。 3D转换元素，还可以更改元素的Z轴
语法：transform-origin: x-axis y-axis z-axis;

属性值：
- x-axis 定义视图被置于 X 轴的何处。可能的值：left center right bottom length %
- y-axis 定义视图被置于 Y 轴的何处。可能的值：top center bottom length %
- z-axis 定义视图被置于 Z 轴的何处。可能的值：length
````
div
{
transform: rotate(45deg);
transform-origin:20% 40%;
-ms-transform: rotate(45deg); /* IE 9 */
-ms-transform-origin:20% 40%; /* IE 9 */
-webkit-transform: rotate(45deg); /* Safari and Chrome */
-webkit-transform-origin:20% 40%; /* Safari and Chrome */
}
````
### transform-style 属性
指定嵌套元素是怎样在三维空间中呈现
注意： 使用此属性必须先使用 transform 属性

语法：transform-style: flat|preserve-3d;

属性值
- flat	表示所有子元素在2D平面呈现
- preserve-3d	表示所有子元素在3D空间中呈现

### perspective 属性
从视图的perspective属性定义。这个属性允许你改变3D元素是怎样查看透视图

语法：perspective: number|none;

属性值：
- number	元素距离视图的距离，以像素计
- none	默认值。与 0 相同。不设置透视
````
div
{
        perspective: 500;
        -webkit-perspective: 500; /* Safari and Chrome */
}
````

### perspective-origin 属性
定义 3D 元素所基于的 X 轴和 Y 轴。该属性允许您改变 3D 元素的底部位置

语法：perspective-origin: x-axis y-axis;

属性值：
- x-axis 定义该视图在 x 轴上的位置。默认值：50% 可能值：left center right length %
- y-axis 定义该视图在 y 轴上的位置。默认值：50% 可能值：top center bottom length %
````
div
{
        perspective:150;
        perspective-origin: 10% 10%;
        -webkit-perspective:150; /* Safari and Chrome */
        -webkit-perspective-origin: 10% 10%; /* Safari and Chrome */
}
````

### backface-visibility 属性
定义当元素不面向屏幕时是否可见,如果在旋转元素不希望看到其背面时，该属性很有用

属性值：
- visible	背面是可见的
- hidden	背面是不可见的
````
div
{
backface-visibility:hidden;
-webkit-backface-visibility:hidden; /* Chrome and Safari */
-moz-backface-visibility:hidden; /* Firefox */
-ms-backface-visibility:hidden; /* Internet Explorer */
}
````