# elementUi框架
https://element.eleme.cn/#/zh-CN/component/installation
## 简介
element-ui是一个ui库，它不依赖于vue。但是却是当前和vue配合做项目开发的一个比较好的ui框架。

## 引入element
可以引入整个 Element，或是根据需要仅引入部分组件
### 完整引入
在main.js中写入如下内容
````
import Vue from 'vue';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App.vue';

Vue.use(ElementUI);

new Vue({
  el: '#app',
  render: h => h(App)
});
````
### 按需引入
借助 babel-plugin-component，我们可以只引入需要的组件，以达到减小项目体积的目的
首先，安装 babel-plugin-component,借助该组件只引入需要的组件，以达到减小项目体积的目的。
- 安装 babel-plugin-component
````
npm install babel-plugin-component -D
````
- 修改 .babelrc文件
````
{
  "presets": [["es2015", { "modules": false }]],
  "plugins": [
    [
      "component",
      {
        "libraryName": "element-ui",
        "styleLibraryName": "theme-chalk"
      }
    ]
  ]
}
````
- 引入部分组件，比如 Button 和 Select，那么需要在 main.js 中写入以下内容：
````
import Vue from 'vue';
import { Button, Select } from 'element-ui';
import App from './App.vue';

Vue.component(Button.name, Button);
Vue.component(Select.name, Select);
/* 或写为
 * Vue.use(Button)
 * Vue.use(Select)
 */

new Vue({
  el: '#app',
  render: h => h(App)
});
````
