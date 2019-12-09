## CSS 函数
https://www.runoob.com/cssref/func-calc.html
### attr() 
语法：attr(attribute-name)  返回选择元素的属性值
attribute-name 必须是HTML元素的属性名
````
a:after {
    content: " (" attr(href) ")";
}
````
### calc() 
语法：calc(expression) 用于动态计算长度值
+ 运算符前后都需要保留一个空格，例如：width: calc(100% - 10px)；
+ 任何长度值都可以使用calc()函数进行计算；
+ calc()函数支持 "+", "-", "*", "/" 运算；
+ alc()函数使用标准的数学运算优先级规则；
```
height: calc(100% - 10px)
height: calc(100vh - 200px)
weight: calc(100% - 10px)
weight: calc(100vh - 200px)

#div1 {
    left: 50px;
    width: calc(100% - 100px);
}
```

### hsl() 
hsl() 函数使用色相、饱和度、亮度来定义颜色。

语法：hsl(hue, saturation, lightness)

+ 色相（H）是色彩的基本属性，就是平常所说的颜色名称，如红色、黄色等。
  - 定义色相 (0 到 360) - 0 (或 360) 为红色, 120 为绿色, 240 为蓝色
+ 饱和度（S）是指色彩的纯度，越高色彩越纯，低则逐渐变灰，取 0-100% 的数值。
  - 定义饱和度; 0% 为灰色， 100% 全色
+ 亮度（L），取 0-100%，增加亮度，颜色会向白色变化；减少亮度，颜色会向黑色变化。
  - 定义亮度 0% 为暗, 50% 为普通, 100% 为白
````
#p1 {background-color:hsl(120,100%,50%);} /* 绿色 */
#p2 {background-color:hsl(120,100%,75%);} /* 浅绿  */
#p3 {background-color:hsl(120,100%,25%);} /* 暗绿  */
#p4 {background-color:hsl(120,60%,70%);} /* 柔和的绿色 */
````  

### hsla() 
hsla() 函数使用色相、饱和度、亮度、透明度来定义颜色

语法：hsla(hue, saturation, lightness, alpha)

+ 色相（H）是色彩的基本属性，就是平常所说的颜色名称，如红色、黄色等。
  * 定义色相 (0 到 360) - 0 (或 360) 为红色, 120 为绿色, 240 为蓝色
+ 饱和度（S）是指色彩的纯度，越高色彩越纯，低则逐渐变灰，取 0-100% 的数值。
  * 定义饱和度; 0% 为灰色， 100% 全色
+ 亮度（L） 取 0-100%，增加亮度，颜色会向白色变化；减少亮度，颜色会向黑色变化。
  * 定义亮度 0% 为暗, 50% 为普通, 100% 为白
+ 透明度（A） 取值 0~1 之间， 代表透明度。
  * 定义透明度 0（透完全明） ~ 1（完全不透明）
````
#p1 {background-color:hsl(120,100%,50%,0.3);} /* 绿色 */
#p2 {background-color:hsl(120,100%,75%,0.3);} /* 浅绿  */
#p3 {background-color:hsl(120,100%,25%,0.3);} /* 暗绿  */
#p4 {background-color:hsl(120,60%,70%,0.3);} /* 柔和的绿色 */
````  
### linear-gradient()
linear-gradient() 函数用于创建一个线性渐变的 "图像"。

语法：background-image: linear-gradient(direction, color-stop1, color-stop2, ...);
````
#grad {
  background-image: linear-gradient(to right, red , blue);
}
````

### radial-gradient()
radial-gradient() 函数用径向渐变创建 "图像"。

语法：background-image: radial-gradient(shape size at position, start-color, ..., last-color);

shape：确定圆的类型
+ ellipse (默认): 指定椭圆形的径向渐变。
+ circle ：指定圆形的径向渐变

size：定义渐变的大小，可能值
+ farthest-corner (默认) : 指定径向渐变的半径长度为从圆心到离圆心最远的角
+ closest-side ：指定径向渐变的半径长度为从圆心到离圆心最近的边
+ closest-corner ： 指定径向渐变的半径长度为从圆心到离圆心最近的角
+ farthest-side ：指定径向渐变的半径长度为从圆心到离圆心最远的边

position：定义渐变的位置。可能值：
+ center（默认）：设置中间为径向渐变圆心的纵坐标值。
+ top：设置顶部为径向渐变圆心的纵坐标值。
+ bottom：设置底部为径向渐变圆心的纵坐标值。
````
#grad2 {
  background-image: radial-gradient(farthest-side at 60% 55%, blue, green, yellow, black);
}
````

### rgb()
rgb() 函数使用红(R)、绿(G)、蓝(B)三个颜色的叠加来生成各式各样的颜色

语法：rgb(red, green, blue)
+ red 定义红色值，取值范围为 0 ~ 255，也可以使用百分比 0% ~ 100%。
+ green 定义绿色值，取值范围为 0 ~ 255，也可以使用百分比 0% ~ 100%。
+ blue 定义蓝色值，取值范围为 0 ~ 255，也可以使用百分比 0% ~ 100%。

### rgba()
rgba() 函数使用红(R)、绿(G)、蓝(B)、透明度(A)的叠加来生成各式各样的颜色。
语法：rgba(red, green, blue, alpha)
+ red 定义红色值，取值范围为 0 ~ 255，也可以使用百分比 0% ~ 100%。
+ green 定义绿色值，取值范围为 0 ~ 255，也可以使用百分比 0% ~ 100%。
+ blue 定义蓝色值，取值范围为 0 ~ 255，也可以使用百分比 0% ~ 100%。
+ alpha 定义透明度 0（透完全明） ~ 1（完全不透明）

### var() 
var() 函数用于插入自定义的属性值，如果一个属性值在多处被使用，该方法就很有用。

语法：var(custom-property-name, value)
+ custom-property-name 必需。自定义属性的名称，必需以 -- 开头。
+ value 可选。备用值，在属性不存在的时候使用。

````
:root {
  --main-bg-color: coral;
}
 
#div1 {
  background-color: var(--main-bg-color);
}
````
