# vue的模板语法
Vue.js 使用了基于 HTML 的模版语法，允许开发者声明式地将 DOM 绑定至底层 Vue 实例的数据。

Vue.js 的核心是一个允许你采用简洁的模板语法来声明式的将数据渲染进 DOM 的系统。

## 插值
### 文本
数据绑定最常见的形式就是使用 {{...}}（双大括号）的文本插值：
无论何时，绑定的数据对象上 msg 属性发生了改变，插值处的内容都会更新
注意：通过使用 v-once 指令，你也能执行一次性地插值，当数据改变时，插值处的内容不会更新
````
<span>Message: {{ msg }}</span>

<span v-once>这个将不会改变: {{ msg }}</span>
````
### html
使用 v-html 指令用于输出 html 代码：
````
<div id="app">
    <div v-html="message"></div>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: '<h1>菜鸟教程</h1>'
  }
})
</script>
````
### 属性
HTML 属性中的值应使用 v-bind 指令

Mustache语法不能作用在 HTML 特性也就是属性上，遇到这种情况应该使用 v-bind 指令

实例判断 class1 的值，如果为 true 使用 class1 类的样式，否则不使用该类：
````
<div id="app">
  <label for="r1">修改颜色</label><input type="checkbox" v-model="use" id="r1">
  <br><br>
  <div v-bind:class="{'class1': use}">
    v-bind:class 指令
  </div>
</div>
    
<script>
new Vue({
    el: '#app',
  data:{
      use: false
  }
});
</script>
````
### 表达式
Vue.js 都提供了完全的 JavaScript 表达式支持。
注意：每个绑定都只能包含单个表达式，语句以及流控制等都不会生效
````
<div id="app">
    {{5+5}}<br>
    {{ ok ? 'YES' : 'NO' }}<br>
    {{ message.split('').reverse().join('') }}
    <div v-bind:id="'list-' + id">菜鸟教程</div>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    ok: true,
    message: 'RUNOOB',
    id : 1
  }
})
</script>
````
### 指令
指令是带有 v- 前缀的特殊属性。

指令用于在表达式的值改变时，将某些行为应用到 DOM 上。如下例子：
````
<div id="app">
    <p v-if="seen">现在你看到我了</p>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    seen: true
  }
})
</script>
````
### 参数
一些指令能够接收一个“参数”，在指令名称之后以冒号表示。例如，v-bind 指令可以用于响应式地更新 HTML 特性：
````
<div id="app">
    <pre><a v-bind:href="url">菜鸟教程</a></pre>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    url: 'http://www.runoob.com'
  }
})
</script>
````
v-on 指令，它用于监听 DOM 事件

在这里参数是监听的事件名。
字符串反转功能
````
<div id="app">
    <p>{{ message }}</p>
    <button v-on:click="reverseMessage">反转字符串</button>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: 'Runoob!'
  },
  methods: {
    reverseMessage: function () {
      this.message = this.message.split('').reverse().join('')
    }
  }
})
</script>
````

### 修饰符
修饰符是以半角句号 . 指明的特殊后缀，用于指出一个指令应该以特殊方式绑定。
例如，.prevent 修饰符告诉 v-on 指令对于触发的事件调用 event.preventDefault()：
````
<form v-on:submit.prevent="onSubmit"></form>
````

### 用户输入
在 input 输入框中我们可以使用 v-model 指令来实现双向数据绑定：
双向数据绑定:

v-model 指令用来在 input、select、textarea、checkbox、radio 等表单控件元素上创建双向数据绑定，
根据表单上的值，自动更新绑定的元素的值。
````
<div id="app">
    <p>{{ message }}</p>
    <input v-model="message">
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: 'Runoob!'
  }
})
</script>
````
### 过滤器
Vue.js 允许你自定义过滤器，被用作一些常见的文本格式化。由"管道符"指示, 格式如下：
````
<!-- 在两个大括号中 -->
{{ message | capitalize }}

<!-- 在 v-bind 指令中 -->
<div v-bind:id="rawId | formatId"></div>
````
过滤器函数接受表达式的值作为第一个参数。
````
<div id="app">
  {{ message | capitalize }}
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: 'runoob'
  },
  filters: {
    capitalize: function (value) {
      if (!value) return ''
      value = value.toString()
      return value.charAt(0).toUpperCase() + value.slice(1)
    }
  }
})
</script>
````
过滤器可以串联：{{ message | filterA | filterB }}
过滤器是 JavaScript 函数，因此可以接受参数：{{ message | filterA('arg1', arg2) }}
注意：这里，message 是第一个参数，字符串 'arg1' 将传给过滤器作为第二个参数， arg2 表达式的值将被求值然后传给过滤器作为第三个参数。

### 缩写
v-bind 缩写
Vue.js 为两个最为常用的指令提供了特别的缩写：
````
<!-- 完整语法 -->
<a v-bind:href="url"></a>
<!-- 缩写 -->
<a :href="url"></a>
````
v-on 缩写
````
<!-- 完整语法 -->
<a v-on:click="doSomething"></a>
<!-- 缩写 -->
<a @click="doSomething"></a>
````
