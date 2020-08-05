## Dynamic UI Composition 动态UI组合

Aurelia的动态模板合成功能概述

### Introduction

在使用Aurelia的<compose>元素时，在使用的视图模型内部，您可以访问Aurelia的所有标准视图生命周期事件，例如attached，以及其他回调挂钩

### Basic Composition 基本构成

使用该<compose>元素，我们将动态组成一个视图

hello-world.html
````
<template>
    <compose view-model="./compose-me"></compose>
  </template>
````

compose-me.js
````
export class ComposeMe {
  }
````
compose-me.html
````
<template>
    <p>Hello World!!</p>
  </template>
````
- 在hello-world.html模板内部，我们正在使用<compose>元素并通过一个要呈现的视图模型（无文件扩展名）传递
- 因为Aurelia是一个基于约定的框架，所以该<compose>元素知道使用默认约定为我们的同名视图模型加载匹配的视图

### Composing Without a View-Model

如果您只想动态组成视图模板而不指定视图模型，那么您要做的就是忽略该view-model属性并提供一个view。
结果将是当前视图模型将用作我们视图的绑定上下文，从而允许您创建采用当前属性和方法的HTML部分

hello-world.html
````
<template>
    <compose view="./compose-me.html"></compose>
  </template>
````

compose-me.html
````
<template>
    <p>Hello World!!</p>
  </template>
````
- 对于view属性，我们需要指定文件扩展名，这与不具有扩展名的view-model属性不同
- 继承了compose使用元素的绑定上下文

### Passing Through Data 传递数据

可以动态地组成视图模型和视图，并通过元素上的model属性传递其他数据<compose>

hello-world.js
````
export class HelloWorld {
      constructor() {
        this.data = {
          name: 'John Doe',
          company: 'Cool Co.',
          likes: ['Javascript', 'fruit', 'jelly']
        };
      }
  }
````
hello-world.html
````
<template>
    <compose view-model="./compose-me" model.bind="data"></compose>
  </template>
````
compose-me.js
````
export class ComposeMe {
    activate(model) {
      this.data = model;
    }
  }
````
compose-me.html
````
<template>
    <p>Hello, my name is ${data.name} and my company is ${data.company}.</p>
    <p>My likes include:</p>
    <ol>
      <li repeat.for="like of data.likes">${like}</li>
    </ol>
  </template>
````

- 以相同的方式获得提供的模型对象
  - 作为方法的第一个参数activate。然后，我们将该对象存储在我们的类本身上，使其在HTML视图中名为的属性下可用data


















