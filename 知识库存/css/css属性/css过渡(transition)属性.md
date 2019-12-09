### transition 属性
设置元素当过渡效果，四个简写属性为：
- transition-property
- transition-duration
- transition-timing-function
- transition-delay

注意： 始终指定transition-duration属性，否则持续时间为0，transition不会有任何效果

- 语法：transition: property duration timing-function delay;

属性值：
- transition-property	指定CSS属性的name，transition效果
- transition-duration	transition效果需要指定多少秒或毫秒才能完成
- transition-timing-function	指定transition效果的转速曲线
- transition-delay	定义transition效果开始的时候
````
div
{
    width:100px;
    transition: width 2s;
    -webkit-transition: width 2s; /* Safari */
}
div:hover {width:300px;}
````

### transition-property属性
指定CSS属性的nametransition效果（transition效果时将会启动指定的CSS属性的变化）

语法：transition-property: none|all| property;

属性值：
- none	没有属性会获得过渡效果
- all	所有属性都将获得过渡效果
- property	定义应用过渡效果的 CSS 属性名称列表，列表以逗号分隔
````
div
{
transition-property:width;
-moz-transition-property: width; /* Firefox 4 */
-webkit-transition-property:width; /* Safari and Chrome */
-o-transition-property:width; /* Opera */
}

div:hover {width:300px;}
````

### transition-duration 属性
规定完成过渡效果需要花费的时间（以秒或毫秒计）
语法：transition-duration: time;

属性值：
- time	规定完成过渡效果需要花费的时间（以秒或毫秒计）。 默认值是 0，意味着不会有效果
````
transition-duration: 5s;
-webkit-transition-duration: 5s; /* Safari */
````

### transition-timing-function 属性
指定切换效果的速度，此属性允许一个过渡效果，以改变其持续时间的速度
语法：transition-timing-function: linear|ease|ease-in|ease-out|ease-in-out|cubic-bezier(n,n,n,n);

属性值：
- linear	规定以相同速度开始至结束的过渡效果（等于 cubic-bezier(0,0,1,1)）
- ease	规定慢速开始，然后变快，然后慢速结束的过渡效果（cubic-bezier(0.25,0.1,0.25,1)）
- ease-in	规定以慢速开始的过渡效果（等于 cubic-bezier(0.42,0,1,1)）
- ease-out	规定以慢速结束的过渡效果（等于 cubic-bezier(0,0,0.58,1)）
- ease-in-out	规定以慢速开始和结束的过渡效果（等于 cubic-bezier(0.42,0,0.58,1)）
- cubic-bezier(n,n,n,n)	在 cubic-bezier 函数中定义自己的值。可能的值是 0 至 1 之间的数值

````
transition-timing-function: linear;
-webkit-transition-timing-function: linear; /* Safari and Chrome */
````

### transition-delay 属性
transition-delay 属性指定何时将开始切换效果

transition-delay值是指以秒为单位（S）或毫秒（ms）

语法：transition-delay: time;
属性值
- time	指定秒或毫秒数之前要等待切换效果开始
````
transition-delay: 2s;
-webkit-transition-delay: 2s; /* google Safari */
````