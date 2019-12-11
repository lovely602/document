# vue样式绑定
class 与 style 是 HTML 元素的属性，用于设置元素的样式，我们可以用 v-bind 来设置样式属性。

Vue.js v-bind 在处理 class 和 style 时， 专门增强了它。
表达式的结果类型除了字符串之外，还可以是对象或数组。

## class属性绑定
### 对象语法
为 v-bind:class 设置一个对象，从而动态的切换 class:
实例中将 isActive 设置为 true 显示了一个绿色的 div 块，如果设置为 false 则不显示
````
<div v-bind:class="{ active: isActive }"></div>
````
可以在对象中传入更多属性用来动态切换多个 class
text-danger 类背景颜色覆盖了 active 类的背景色：
````
<div class="static"
     v-bind:class="{ active: isActive, 'text-danger': hasError }">
</div>
````
直接绑定数据里的一个对象
text-danger 类背景颜色覆盖了 active 类的背景色
````
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Vue 测试实例 - 菜鸟教程(runoob.com)</title>
<script src="https://cdn.staticfile.org/vue/2.2.2/vue.min.js"></script>
<style>
.active {
	width: 100px;
	height: 100px;
	background: green;
}
.text-danger {
	background: red;
}
</style>
</head>
<body>
<div id="app">
  <div v-bind:class="classObject"></div>
</div>

<script>
new Vue({
  el: '#app',
  data: {
    classObject: {
      active: true,
      'text-danger': true
    }
  }
})
</script>
</body>
</html>
````
### 数组语法
可以把一个数组传给 v-bind:class，以应用一个 class 列表
````
<div v-bind:class="[activeClass, errorClass]"></div>
<div v-bind:class="[errorClass ,isActive ? activeClass : '']"></div>
````

## Vue.js style(内联样式)
可以在 v-bind:style 直接设置样式
````
<div id="app">
    <div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }">菜鸟教程</div>
</div>
````
### 对象语法
直接绑定到一个样式对象，让模板更清晰
````
<div id="app">
  <div v-bind:style="styleObject">菜鸟教程</div>
</div>
````
### 数组语法
v-bind:style 可以使用数组将多个样式对象应用到一个元素上
````
<div id="app">
  <div v-bind:style="[baseStyles, overridingStyles]">菜鸟教程</div>
</div>
````
### 自动添加浏览器前缀

### 多重值
为 style 绑定中的属性提供一个包含多个值的数组，常用于提供多个带前缀的值
````
<div :style="{ display: ['-webkit-box', '-ms-flexbox', 'flex'] }"></div>
````
只会渲染数组中最后一个被浏览器支持的值。在本例中，如果浏览器支持不带浏览器前缀的 flexbox，那么就只会渲染 display: flex











