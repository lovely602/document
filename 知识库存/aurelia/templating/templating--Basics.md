## Templating: Basics

使用Aurelia模板引擎的基本指南

### Introduction

Aurelia的模板系统简单易学，但功能强大，甚至可以构建最复杂的应用程序。
本文将引导您完成静态模板的构建，将模板导入父模板，通过视图模型绑定和操作数据以及使用条件，重复器和事件

### A Simple Template

所有Aurelia模板都必须包含一个<template>元素。最基本的模板是打印“ Hello World”的组件

````
<template>
    <p>
      Hello, World!
    </p>
  </template>
````

Aurelia模板系统的关键功能之一是帮助减少javascript代码和模板标记之间的上下文切换。
使用${}运算符进行字符串插值是ES2015中的一项新功能，可轻松将值插入字符串。
因此，Aurelia在模板中使用此标准语法

````
<template>
    <p>
      ${arriving ? 'Hello' : 'Goodbye'}, ${name}!
    </p>
  </template>
````

### Binding

Aurelia中的绑定允许视图模型中的数据驱动模板行为。绑定的最基本示例是使用链接文本框到视图模型value.bind

````
<template>
    <label for="nameField">
      Who to greet?
    </label>
    <input type="text" value.bind="name" id="nameField">
    <label for="arrivingBox">
      Arriving?
    </label>
    <input type="checkbox" checked.bind="arriving" id="arrivingBox">
    <p>
      ${arriving ? 'Hello' : 'Goodbye'}, ${name}!
    </p>
  </template>
````

### Binding Focus

使用双向数据绑定来传达元素是否具有焦点

````
<template>
    <input focus.bind="hasFocus">
    ${hasFocus}
  </template>
````

### Binding Scopes Using with 

声明标记的某些部分将引用视图模型中对象的属性

bind-with.html
````
<template>
    <p with.bind="first">
      <input type="text" value.bind="message">
    </p>
    <p with.bind="second">
      <input type="text" value.bind="message">
    </p>
  </template>
````

bind-with.js
````
export class Hello {
    constructor() {
      this.first = {
        message : 'Hello'
      };
      this.second = {
        message : 'Goodbye'
      }
    }
  }
````

### Composition

为了遵循DRY（不要重复自己）原则，我们不一定要依靠视图和视图模型对之间的紧密耦合。
如果有一个自定义元素可以任意组合一个HTML模板，一个视图模型甚至可能还有一些初始化数据

````
<template>
    <compose view-model="hello"
              view="./hello.html"
              model.bind="{ target : 'World' }" ></compose>
  </template>
````

### The as-element Attribute

当使用Aurelia自定义元素创建表行时，您可能需要将自定义元素伪装成标准HTML元素。
例如，如果您试图用数据填充表行，
则可能需要将自定义元素显示为<tr>行或<td>单元格。这是该as-element属性派上用场的地方

as-element.html
````
<template>
    <require from="./hello-row.html"></require>
    <table>
      <tr as-element="hello-row">
    </table>
  </template>
````

hello-row.html
````
template>
    <td>Hello</td>
    <td>World</td>
  </template>
````

### The View Resource Pipeline

View Resource Pipeline背后的基本思想是我们不仅限于HTML或JavaScript。一个基本的例子是拉入Bootstrap

````
  <template>
    <require from="bootstrap/css/bootstrap.min.css"></require>
    <p class="lead">Hello, World!</p>
    <p>Lorem Ipsum...</p>
  </template>
````

### Conditionals

Aurelia有两个用于条件显示的主要工具：if和show。

区别在于，if将元素从DOM中完全删除，show切换aurelia-hide控制元素可见性的CSS类

条件发生变化时缓存视图实例

默认情况下，if缓存基础视图模型实例。尽管该元件正被从DOM移除和组分经过detached和unbind生命周期事件，其实例被保存在存储器中用于进一步的病情变化。
因此，当元素被隐藏然后再次显示时，if不需要再次初始化组件

通过显式设置指令的cache绑定来选择退出此默认行为if。
当if在自定义元素上使用并在每个外观上初始化它们至关重要时，这特别有用

````
<template>
    <div if="condition.bind: showMessage; cache: false">
      <span>${message}</span>
    </div>
</template>
````
### Repeaters

中继器可用于任何元素，包括自定义元素和模板元素！以下是一些可以使用中继器进行迭代的不同数据类型

- 数组
````
<template>
    <p repeat.for="friend of friends">Hello, ${friend}!</p>
  </template>
  
````
- 范围
````
<template>
    <p repeat.for="i of 10">${10-i}</p>
    <p>Blast off!</p>
  </template>
````
- Sets
````
<template>
    <p repeat.for="friend of friends">Hello, ${friend}!</p>
  </template>
````
- Map
````
<template>
    <p repeat.for="[greeting, friend] of friends">${greeting}, ${friend.name}!</p>
  </template>
````
- 对象
````
<template>
    <p repeat.for="greeting of friends | keys">${greeting}, ${friends[greeting].name}!</p>
  </template>
````











