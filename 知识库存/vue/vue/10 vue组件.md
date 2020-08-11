# vue 组件

组件(component)是vue最强大的功能之一。
组件可以扩展 HTML 元素，封装可重用的代码。
组件系统让我们可以用独立可复用的小组件来构建大型应用，几乎任意类型的应用的界面都可以抽象为一个组件树。

## 基础示例
````
// 定义一个名为 button-counter 的新组件
Vue.component('button-counter', {
  data: function () {
    return {
      count: 0
    }
  },
  template: '<button v-on:click="count++">You clicked me {{ count }} times.</button>'
})
````
注意：一个组件的 data 选项必须是一个函数，因此每个实例可以维护一份被返回对象的独立的拷贝

### 组件的复用
你可以将组件进行任意次复用
````
<div id="components-demo">
  <button-counter></button-counter>
  <button-counter></button-counter>
  <button-counter></button-counter>
</div>
````

### 通过prop向子组件传递参数
Prop 是你可以在组件上注册的一些自定义特性。当一个值传递给一个 prop 特性的时候，它就变成了那个组件实例的一个属性
````
Vue.component('blog-post', {
  props: ['title'],
  template: '<h3>{{ title }}</h3>'
})

<blog-post title="My journey with Vue"></blog-post>
<blog-post title="Blogging with Vue"></blog-post>
<blog-post title="Why Vue is so fun"></blog-post>
````

### 单个根元素
组间模板的内容包裹在一个父元素内,否则会报出every component must have a single root element (每个组件必须只有一个根元素)的错误。
````
<div class="blog-post">
  <h3>{{ title }}</h3>
  <div v-html="content"></div>
</div>
````

## 监听子组件事件
在我们开发组件时，它的一些功能可能要求我们和父级组件进行沟通
### 使用事务抛出一个值
子组件可以通过调用内建的 $emit 方法 并传入事件名称以及可选参数来触发一个事件
````
Vue.component('welcome-button', {
  template: `
    <button v-on:click="$emit('welcome')">
      Click me to be welcomed
    </button>
  `
})
<div id="emit-example-simple">
  <welcome-button v-on:welcome="sayHi"></welcome-button>
</div>
new Vue({
  el: '#emit-example-simple',
  methods: {
    sayHi: function () {
      alert('Hi!')
    }
  }
})
````
## 在组件上使用v-model
自定义事件也可以用于创建支持 v-model 的自定义输入组件
````
Vue.component('custom-input', {
  props: ['value'],
  template: `
    <input
      v-bind:value="value"
      v-on:input="$emit('input', $event.target.value)"
    >
  `
})

<custom-input v-model="searchText"></custom-input>
````
- 将其 value 特性绑定到一个名叫 value 的 prop 上
- 在其 input 事件被触发时，将新的值通过自定义的 input 事件抛出

## 通过插槽分发内容
Vue 自定义的 slot 元素可以让我们自定义元素
````
Vue.component('alert-box', {
  template: `
    <div class="demo-alert-box">
      <strong>Error!</strong>
      <slot></slot>
    </div>
  `
})
````

## 动态组件
有的时候，在不同组件之间进行动态切换是非常有用的，比如在一个多标签的界面
通过 Vue 的 <component> 元素加一个特殊的 is 特性来实现

currentTabComponent 可以包括
- 已注册组件的名字
- 一个组件的选项对象
````
<!-- 组件会在 `currentTabComponent` 改变时改变 -->
<component v-bind:is="currentTabComponent"></component>
````

### 解析dom模板时的注意事项
有些 HTML 元素，诸如 ul、ol、table 和 select，对于哪些元素可以出现在其内部是有严格限制的。
而有些元素，诸如 li、tr 和 option，只能出现在其它某些特定的元素内部。

使用这些有约束条件的元素时遇到一些问题。例如：
````
<table>
  <blog-post-row></blog-post-row>
</table>
````
这个自定义组件 blog-post-row 会被作为无效的内容提升到外部，并导致最终渲染结果出错。幸好这个特殊的 is 特性给了我们一个变通的办法
````
<table>
  <tr is="blog-post-row"></tr>
</table>
````


# 注册组件

### 组件名大小写
- 使用 kebab-case
````
Vue.component('my-component-name', { /* ... */ })
````
- 使用 PascalCase
````
Vue.component('MyComponentName', { /* ... */ })
````

### 全局注册组件
注册一个全局组件语法格式如下：
````
Vue.component(tagName, options)
````
tagName 为组件名，options 为配置选项。注册后，我们可以使用以下方式来调用组件：
````
<div id="app">
    <runoob></runoob>
</div>
 
<script>
// 注册
Vue.component('runoob', {
  template: '<h1>自定义组件!</h1>'
})
// 创建根实例
new Vue({
  el: '#app'
})
</script>
````

### 局部组件
全局注册往往是不够理想的。
比如，如果你使用一个像 webpack 这样的构建系统，全局注册所有的组件意味着即便你已经不再使用一个组件了，它仍然会被包含在你最终的构建结果中。
这造成了用户下载的 JavaScript 的无谓的增加
````
new Vue({
  el: '#app',
  components: {
    'component-a': ComponentA,
    'component-b': ComponentB
  }
})
````

## 模块系统

### 在模块系统中局部注册
现在 BaseButton 和 BaseInput 都可以在 ComponentB 的模板中使用了
````
import BaseButton from './BaseButton.vue'
import BaseInput from './BaseInput.vue'

export default {
  components: {
    BaseButton,
    BaseInput
  }
}
````

### 基础组件的自动化全局注册
````
import ElementUI from 'element-ui';
Vue.use(ElementUI);
````
## Prop
prop 是父组件用来传递数据的一个自定义属性。
父组件的数据需要通过 props 把数据传给子组件，子组件需要显式地用 props 选项声明 "prop"

### Prop 的大小写 (camelCase vs kebab-case)
HTML 中的特性名是大小写不敏感的，所以浏览器会把所有大写字符解释为小写字符。
这意味着当你使用 DOM 中的模板时，camelCase (驼峰命名法) 的 prop 名需要使用其等价的 kebab-case (短横线分隔命名) 命名
````
Vue.component('blog-post', {
  // 在 JavaScript 中是 camelCase 的
  props: ['postTitle'],
  template: '<h3>{{ postTitle }}</h3>'
})
<!-- 在 HTML 中是 kebab-case 的 -->
<blog-post post-title="hello!"></blog-post>
````
### prop 自定义属性

````
props: {
  title: String,
  likes: Number,
  isPublished: Boolean,
  commentIds: Array,
  author: Object,
  callback: Function,
  contactsPromise: Promise // or any other constructor
}
````
### 动态prop
用 v-bind 绑定 HTML 特性到一个表达式，也可以用 v-bind 动态绑定 props 的值到父组件的数据中。
每当父组件的数据变化时，该变化也会传导给子组件
注意: prop 是单向绑定的：当父组件的属性变化时，将传导给子组件，但是不会反过来。
````
这样给 prop 传入一个静态的值：

<blog-post title="My journey with Vue"></blog-post>
 prop 可以通过 v-bind 动态赋值，例如：

<!-- 动态赋予一个变量的值 -->
<blog-post v-bind:title="post.title"></blog-post>

<!-- 动态赋予一个复杂表达式的值 -->
<blog-post
  v-bind:title="post.title + ' by ' + post.author.name"
></blog-post>
````
### 单向数据流
所有的 prop 都使得其父子 prop 之间形成了一个单向下行绑定：父级 prop 的更新会向下流动到子组件中，但是反过来则不行。
这样会防止从子组件意外改变父级组件的状态，从而导致你的应用的数据流向难以理解。

### prop验证
组件可以为 props 指定验证要求
````
Vue.component('my-component', {
  props: {
    // 基础的类型检查 (`null` 和 `undefined` 会通过任何类型验证)
    propA: Number,
    // 多个可能的类型
    propB: [String, Number],
    // 必填的字符串
    propC: {
      type: String,
      required: true
    },
    // 带有默认值的数字
    propD: {
      type: Number,
      default: 100
    },
    // 带有默认值的对象
    propE: {
      type: Object,
      // 对象或数组默认值必须从一个工厂函数获取
      default: function () {
        return { message: 'hello' }
      }
    },
    // 自定义验证函数
    propF: {
      validator: function (value) {
        // 这个值必须匹配下列字符串中的一个
        return ['success', 'warning', 'danger'].indexOf(value) !== -1
      }
    }
  }
})
````
## 自定义事件

### 事件名
不同于组件和 prop，事件名不存在任何自动化的大小写转换。而是触发的事件名需要完全匹配监听这个事件所用的名称。
举个例子，如果触发一个 camelCase 名字的事件：
````
this.$emit('myEvent')
则监听这个名字的 kebab-case 版本是不会有任何效果的：

<!-- 没有效果 -->
<my-component v-on:my-event="doSomething"></my-component>
````
推荐你始终使用 kebab-case 的事件名

### 自定义组件的 v-model

父组件是使用 props 传递数据给子组件，但如果子组件要把数据传递回去，就需要使用自定义事件
使用 v-on 绑定自定义事件, 每个 Vue 实例都实现了事件接口(Events interface)，即：

+ 使用 $on(eventName) 监听事件
+ 使用 $emit(eventName) 触发事件

父组件可以在使用子组件的地方直接用 v-on 来监听子组件触发的事件
````
Vue.component('base-checkbox', {
  model: {
    prop: 'checked',
    event: 'change'
  },
  props: {
    checked: Boolean
  },
  template: `
    <input
      type="checkbox"
      v-bind:checked="checked"
      v-on:change="$emit('change', $event.target.checked)"
    >
  `
})

<base-checkbox v-model="lovingVue"></base-checkbox>
````
这里的 lovingVue 的值将会传入这个名为 checked 的 prop
同时当 base-checkbox 触发一个 change 事件并附带一个新的值的时候，这个 lovingVue 的属性将会被更新

## .sync 修饰符
在有些情况下，我们可能需要对一个 prop 进行“双向绑定”。
不幸的是，真正的双向绑定会带来维护上的问题，因为子组件可以修改父组件，且在父组件和子组件都没有明显的改动来源

````
this.$emit('update:title', newTitle)
然后父组件可以监听那个事件并根据需要更新一个本地的数据属性。例如：

<text-document
  v-bind:title="doc.title"
  v-on:update:title="doc.title = $event"
></text-document>
为了方便起见，我们为这种模式提供一个缩写，即 .sync 修饰符：

<text-document v-bind:title.sync="doc.title"></text-document>
````

注意带有 .sync 修饰符的 v-bind 不能和表达式一起使用 (例如 v-bind:title.sync=”doc.title + ‘!’” 是无效的)。
你只能提供你想要绑定的属性名，类似 v-model。

## 插槽

### 编译作用域
````
<navigation-link url="/profile">
  Logged in as {{ user.name }}
</navigation-link>

<navigation-link url="/profile">
  Clicking here will send you to: {{ url }}
  <!--
  这里的 `url` 会是 undefined，因为 "/profile" 是
  _传递给_ <navigation-link> 的而不是
  在 <navigation-link> 组件*内部*定义的。
  -->
</navigation-link>
````

父级模板里的所有内容都是在父级作用域中编译的；子模板里的所有内容都是在子作用域中编译的。

### 后备内容
有时为一个插槽设置具体的后备 (也就是默认的) 内容是很有用的，它只会在没有提供内容的时候被渲染
````
<button type="submit">
  <slot></slot>
</button>

<button type="submit">
  <slot>Submit</slot>
</button>
````
### 具名插槽
slot 元素有一个特殊的特性：name。这个特性可以用来定义额外的插槽
````
<div class="container">
  <header>
    <slot name="header"></slot>
  </header>
  <main>
    <slot></slot>
  </main>
  <footer>
    <slot name="footer"></slot>
  </footer>
</div>

<base-layout>
  <template v-slot:header>
    <h1>Here might be a page title</h1>
  </template>

  <p>A paragraph for the main content.</p>
  <p>And another one.</p>

  <template v-slot:footer>
    <p>Here's some contact info</p>
  </template>
</base-layout>
````

### 具名插槽的缩写
跟 v-on 和 v-bind 一样，v-slot 也有缩写，即把参数之前的所有内容 (v-slot:) 替换为字符 #
v-on: 缩写为  @
v-bind: 缩写为 :
v-slot: 缩写为 #
例如 v-slot:header 可以被重写为 #header
````
<base-layout>
  <template #header>
    <h1>Here might be a page title</h1>
  </template>

  <p>A paragraph for the main content.</p>
  <p>And another one.</p>

  <template #footer>
    <p>Here's some contact info</p>
  </template>
</base-layout>
````

## 动态组件和异步组件

### 在动态组件上使用 keep-alive
重新创建动态组件的行为通常是非常有用的，但是在这个案例中，我们更希望那些标签的组件实例能够被在它们第一次被创建的时候缓存下来。
为了解决这个问题，我们可以用一个 <keep-alive> 元素将其动态组件包裹起来
````
<!-- 失活的组件将会被缓存！-->
<keep-alive>
  <component v-bind:is="currentTabComponent"></component>
</keep-alive>
````















