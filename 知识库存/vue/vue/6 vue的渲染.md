## v-if
v-if 指令用于条件性地渲染一块内容。这块内容只会在指令的表达式返回 truthy 值的时候被渲染。
````
<h1 v-if="awesome">Vue is awesome!</h1>
````

## v-else
可以使用 v-else 指令来表示 v-if 的“else 块”
v-else 元素必须紧跟在带 v-if 或者 v-else-if 的元素的后面，否则它将不会被识别
````
<div v-if="Math.random() > 0.5">
  Now you see me
</div>
<div v-else>
  Now you don't
</div>
````

## v-else-if
充当 v-if 的“else-if 块”，可以连续使用

## 用 key 管理可复用的元素
Vue 会尽可能高效地渲染元素，通常会复用已有元素而不是从头开始渲染。这么做除了使 Vue 变得非常快之外，还有其它一些好处
````
<template v-if="loginType === 'username'">
  <label>Username</label>
  <input placeholder="Enter your username">
</template>
<template v-else>
  <label>Email</label>
  <input placeholder="Enter your email address">
</template>
````

在上面的代码中切换 loginType 将不会清除用户已经输入的内容。
因为两个模板使用了相同的元素，<input> 不会被替换掉——仅仅是替换了它的 placeholder

这样也不总是符合实际需求，所以 Vue 为你提供了一种方式来表达“这两个元素是完全独立的，不要复用它们”。
只需添加一个具有唯一值的 key 属性即可
````
<template v-if="loginType === 'username'">
  <label>Username</label>
  <input placeholder="Enter your username" key="username-input">
</template>
<template v-else>
  <label>Email</label>
  <input placeholder="Enter your email address" key="email-input">
</template>
````

## v-show
根据条件展示元素.
````
<h1 v-show="ok">Hello!</h1>
````

## v-if 和 v-show的区别
- v-if 是“真正”的条件渲染，因为它会确保在切换过程中条件块内的事件监听器和子组件适当地被销毁和重建。
- v-if 也是惰性的：如果在初始渲染时条件为假，则什么也不做——直到条件第一次变为真时，才会开始渲染条件块
- v-show 就简单得多——不管初始条件是什么，元素总是会被渲染，并且只是简单地基于 CSS 进行切换

## v-for
- 在 v-for 块中，我们可以访问所有父作用域的属性。v-for 还支持一个可选的第二个参数，即当前项的索引
- 可以用 of 替代 in 作为分隔符，因为它更接近 JavaScript 迭代器的语法
````
<ul id="example-2">
  <li v-for="(item, index) in items">
    {{ parentMessage }} - {{ index }} - {{ item.message }}
  </li>
</ul>


<div v-for="item of items"></div>
````

### 维护状态
当 Vue 正在更新使用 v-for 渲染的元素列表时，它默认使用“就地更新”的策略。
如果数据项的顺序被改变，Vue 将不会移动 DOM 元素来匹配数据项的顺序，而是就地更新每个元素，并且确保它们在每个索引位置正确渲染

为了给 Vue 一个提示，以便它能跟踪每个节点的身份，从而重用和重新排序现有元素，你需要为每项提供一个唯一 key 属性
````
<div v-for="item in items" v-bind:key="item.id">
  <!-- 内容 -->
</div>
````
注意：不要使用对象或数组之类的非基本类型值作为 v-for 的 key。请用字符串或数值类型的值。

## 数组更新检测

## 变异方法 (mutation method)
Vue 将被侦听的数组的变异方法进行了包裹，所以它们也将会触发视图更新。这些被包裹过的方法有：
- push()
- pop()
- shift()
- unshift()
- splice()
- sort()
- reverse()

## 替换数组
不会改变原始数组，而总是返回一个新数组。当使用非变异方法时，可以用新数组替换旧数组

- filter()
- concat() 
- slice()

````
example1.items = example1.items.filter(function (item) {
  return item.message.match(/Foo/)
})
````
注意事项：
由于 JavaScript 的限制，Vue 不能检测以下数组的变动：
- 当你利用索引直接设置一个数组项时，例如：vm.items[indexOfItem] = newValue
- 当你修改数组的长度时，例如：vm.items.length = newLength

### 对象变更检测注意事项
由于 JavaScript 的限制，Vue 不能检测对象属性的添加或删除
````
var vm = new Vue({
  data: {
    a: 1
  }
})
// `vm.a` 现在是响应式的

vm.b = 2
// `vm.b` 不是响应式的
````

为已有对象赋值多个新属性，比如使用 Object.assign() 或 _.extend()。
在这种情况下，你应该用两个对象的属性创建一个新的对象。所以，如果你想添加新的响应式属性
````
vm.userProfile = Object.assign({}, vm.userProfile, {
  age: 27,
  favoriteColor: 'Vue Green'
})
````
### 显示过滤/排序后的结果

有时，我们想要显示一个数组经过过滤或排序后的版本，而不实际改变或重置原始数据。
在这种情况下，可以创建一个计算属性，来返回过滤或排序后的数组

````
<li v-for="n in evenNumbers">{{ n }}</li>

data: {
  numbers: [ 1, 2, 3, 4, 5 ]
},
computed: {
  evenNumbers: function () {
    return this.numbers.filter(function (number) {
      return number % 2 === 0
    })
  }
}
````




















