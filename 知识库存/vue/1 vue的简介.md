## vue简介
官网：https://cn.vuejs.org/v2/guide/

菜鸟教程：https://www.runoob.com/vue2/vue-tutorial.html

Vue.js 是一套构建用户界面的渐进式框架
- Vue 只关注视图层， 采用自底向上增量开发的设计。
- Vue 的目标是通过尽可能简单的 API 实现响应的数据绑定和组合的视图组件

### vue的版本区别
Vue cli3的包名称由 vue-cli 改成了 @vue/cli
如果你已经全局安装了旧版本的 vue-cli(1.x 或 2.x)，你需要先通过 npm uninstall vue-cli -g 或 yarn global remove vue-cli 卸载它

注意：Node 版本要求
Vue CLI 需要 Node.js 8.9 或更高版本 (推荐 8.11.0+)

### vue的安装
````
npm uninstall -g vue-cli  卸载低版本的vue-cli
npm install -g @vue/cli   安装高版本的vue/cli
````

## vue起步
每个vue应用都需要实例化vue来实现。
````
<div id="vue_det">
    <h1>site : {{site}}</h1>
    <h1>url : {{url}}</h1>
    <h1>{{details()}}</h1>
</div>
<script type="text/javascript">
    var vm = new Vue({
        el: '#vue_det',
        data: {
            site: "菜鸟教程",
            url: "www.runoob.com",
            alexa: "10000"
        },
        methods: {
            details: function() {
                return  this.site + " - 学的不仅是技术，更是梦想！";
            }
        }
    })
</script>
````
字段说明：
 + Vue 构造器中有一个el 参数，它是 DOM 元素中的 id
 + data 用于定义属性，实例中有三个属性分别为：site、url、alexa
 + methods 用于定义的函数，可以通过 return 来返回函数值
 + {{ }} 用于输出对象属性和函数返回值
 注意：当一个 Vue 实例被创建时，它向 Vue 的响应式系统中加入了其 data 对象中能找到的所有的属性。
       当这些属性的值发生改变时，html 视图将也会产生相应的变化。

Vue 实例还提供了一些有用的实例属性与方法。它们都有前缀 $，以便与用户定义的属性区分开来
````
<div id="vue_det">
    <h1>site : {{site}}</h1>
    <h1>url : {{url}}</h1>
    <h1>Alexa : {{alexa}}</h1>
</div>
<script type="text/javascript">
// 我们的数据对象
var data = { site: "菜鸟教程", url: "www.runoob.com", alexa: 10000}
var vm = new Vue({
    el: '#vue_det',
    data: data
})
 
document.write(vm.$data === data) // true
document.write("<br>") 
document.write(vm.$el === document.getElementById('vue_det')) // true
</script>
````       