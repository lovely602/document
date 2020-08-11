## Handling Links 处理链接

### Basic Concept 基本概念

在应用中使用Aurelia路由器时,Aurelia将处理大多数链接（在元素中），而不会触发传统的整页重新加载。
这是任何SPA（单页应用程序）框架的基本功能.

aurelia用DefaultLinkHandler 在aurelia-history-browser实现

基本上注册了一个全局click事件处理程序，以劫持<a>元素，
然后进行前端导航，而不是默认的浏览器行为即重新加载整个页面。

### Skipping Click Hijacking 跳过点击拦截

默认情况下，DefaultLinkHandler在以下情况下，跳过单击拦截

- if it's not clicking primary button (left button for right-handed)
- 如果任何的Alt/ Ctrl/ Meta/ Shift键被按下
- 如果href on <a>元素以#（链接到本地​​哈希）开头，或者是完整的网址，例如http://...或ftp://...
- 如果<a>具有target属性，并且没有针对当前窗口
````
<a href="/some/link" target="_blank">Skip Hijacking</a>
  
  <a href="/some/link">Does Not Skip</a>
  <a href="/some/link" target="_self">Does Not Skip</a>
  <a href="/some/link" target="name-of-current-window">Does Not Skip</a>
````
- 如果<a>具有特殊属性download或router-ignore或data-router-ignore
````
<a href="/some/link" download>Skip Hijacking</a>
  <a href="/some/link" download="">Skip Hijacking</a>
  <a href="/some/link" router-ignore>Skip Hijacking</a>
  <a href="/some/link" router-ignore="">Skip Hijacking</a>
  <a href="/some/link" data-router-ignore>Skip Hijacking</a>
  <a href="/some/link" data-router-ignore="">Skip Hijacking</a>
````

### Conditional Skipping Click Hijacking 有条件的跳过点击拦截

data-router-ignore引入的目的是与Aurelia的另一个功能配合使用：自动创建数据属性

````
 <a href="/some/link" data-router-ignore.bind="condition || null">Conditional Skip Hijacking</a>
````
data-router-ignore当条件改变时，Aurelia将在此处动态添加/删除属性。

注意：|| null是必要的，因为Aurelia仅删除数据属性当绑定值变为null或者undefined，
它不会删除数据属性，当绑定的价值是0或者""甚至是false。
























