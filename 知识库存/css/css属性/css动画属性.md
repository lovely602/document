### @keyframes 规则
1. 使用@keyframes规则，你可以创建动画
2. 创建动画是通过逐步改变从一个CSS样式设定到另一个
3. 在动画过程中，您可以更改CSS样式的设定多次。
4. 指定的变化时发生时使用％，或关键字"from"和"to"，这是和0％到100％相同
5. 0％是开头动画，100％是当动画完成

语法：@keyframes animationname {keyframes-selector {css-styles;}}

属性值
- animationname	必需的。定义animation的名称
- keyframes-selector 必需的。动画持续时间的百分比。
  - 合法值：0-100%，from(和0%相同)，to(和100%相同)
- css-styles 必需的。一个或多个合法的CSS样式属性
````
使一个div元素逐渐移动200像素：
@keyframes mymove
{
from {top:0px;}
to {top:200px;}
}

@-webkit-keyframes mymove /* Safari and Chrome */
{
from {top:0px;}
to {top:200px;}
}
````

### animation（动画） 属性
使用简写属性把 animation 绑定到一个元素

语法：animation: name duration timing-function delay iteration-count direction fill-mode play-state;
属性值
- animation-name	指定要绑定到选择器的关键帧的名称
- animation-duration	动画指定需要多少秒或毫秒完成
- animation-timing-function	设置动画将如何完成一个周期
- animation-delay	设置动画在启动前的延迟间隔
- animation-iteration-count	定义动画的播放次数
- animation-direction	指定是否应该轮流反向播放动画
- animation-fill-mode	规定当动画不播放时（当动画完成时，或当动画有一个延迟未开始播放时），要应用到元素的样式
- animation-play-state	指定动画是否正在运行或已暂停
````
div
{
        animation:mymove 5s infinite;
        -webkit-animation:mymove 5s infinite; /* Safari 和 Chrome */
}
````

### animation-name 属性
为 @keyframes 动画指定名称

语法：animation-name: keyframename|none;

属性值：
- keyframename	指定要绑定到选择器的关键帧的名称
- none	指定有没有动画（可用于覆盖从级联的动画）
````
animation-name:mymove;
-webkit-animation-name:mymove; /* Safari 和 Chrome */
````

### animation-duration 属性
定义动画完成一个周期需要多少秒或毫秒。

语法：animation-duration: time;

属性值：
time	指定动画播放完成花费的时间。默认值为 0，意味着没有动画效果
````
animation-duration:2s;
-webkit-animation-duration:2s; /* Safari 和 Chrome */
````

### animation-timing-function 属性
指定动画将如何完成一个周期

语法：animation-timing-function: value;
属性值
- linear	动画从头到尾的速度是相同的
- ease	默认。动画以低速开始，然后加快，在结束前变慢
- ease-in	动画以低速开始
- ease-out	动画以低速结束
- ease-in-out	动画以低速开始和结束
- cubic-bezier(n,n,n,n)	在 cubic-bezier 函数中自己的值。可能的值是从 0 到 1 的数值
````
animation-timing-function:linear;
-webkit-animation-timing-function:linear; /* Safari and Chrome */
````

### animation-delay 属性
1. animation-delay 属性定义动画什么时候开始。
2. animation-delay 值单位可以是秒（s）或毫秒（ms）。
3. 提示: 允许负值，-2s 使动画马上开始，但跳过 2 秒进入动画。

语法：animation-delay: time;

属性值：
time	可选。定义动画开始前等待的时间，以秒或毫秒计。默认值为0

````
animation-delay:2s;
-webkit-animation-delay:2s; /* Safari 和 Chrome */
````

### animation-iteration-count 属性
定义动画应该播放多少次

语法：animation-iteration-count: value;

属性值
- n	一个数字，定义应该播放多少次动画
- infinite	指定动画应该播放无限次（永远）
````
animation-iteration-count:3;
-webkit-animation-iteration-count:3; /*Safari and Chrome*/
````

### animation-direction 属性
定义是否循环交替反向播放动画

注意：如果动画被设置为只播放一次，该属性将不起作用。

语法：animation-direction: normal|reverse|alternate|alternate-reverse|initial|inherit;

属性值
- normal	默认值。动画按正常播放
- reverse	动画反向播放
- alternate	动画在奇数次（1、3、5...）正向播放，在偶数次（2、4、6...）反向播放
- alternate-reverse	动画在奇数次（1、3、5...）反向播放，在偶数次（2、4、6...）正向播放

### animation-play-state 属性
指定动画是否正在运行或已暂停
注意：在JavaScript中使用此属性在一个周期中暂停动画

属性值：
- paused	指定暂停动画
- running	指定正在运行的动画
````
object object.style.animationPlayState="paused"

animation-play-state:paused;
-webkit-animation-play-state:paused; /* Safari 和 Chrome */
````