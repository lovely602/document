## Custom Elements Basics 自定义元素基础

Aurelia模板引擎的自定义元素功能基础概述。自定义元素用于向Aurelia应用程序添加自定义组件

### Introduction

定制元素是Aurelia应用程序开发人员将组件组成应用程序的主要工具

### HTML Only Custom Element

当在视图中需要仅HTML的自定义元素时，必须包括.html扩展名。
它甚至可以通过把一个逗号创建的HTML只自定义元素绑定属性上分离的属性名称列表bindable中的属性template元素。
将camelCase可绑定属性转换为破折号的Aurelia约定适用于提供给bindable 属性

hello-world.html
````
<template bindable="firstName, lastName">
    Hello, ${firstName} ${lastName}!
  </template>
````

app.html
````
<template>
    <require from="./hello-world.html"></require>
  
    <hello-world first-name="Albert" last-name="Einstein"></hello-world>
  </template>
````

### Custom Element Basics 自定义元素基础

只需创建具有相同名称的JavaScript和HTML文件对，即可创建Aurelia自定义元素。HTML文件必须包含包装在template元素中的Aurelia模板。
JavaScript文件必须导出JavaScript类。
Aurelia对于自定义元素VM类的标准命名约定是CustomElement在类名的末尾附加，例如SecretMessageCustomElement

secret-message.js
````
export class SecretMessageCustomElement {
    secretMessage = 'Be sure to drink your Ovaltine!';
  }
````
secret-message.html
````
<template>
    ${secretMessage}
  </template>
````
app.html
````
<template>
    <require from="./secret-message"></require>
  
    And now, it's time for a secret message: <secret-message></secret-message>
  </template>
````

通过使用customElementVM类上的装饰器来显式命名您的自定义元素

@customElement('SecretMessage')不会转换为，secret-message而是转换为secretmessage。
如果将任何大写字母传递给装饰器，并且启用了开发日志记录，则Aurelia将记录一条消息，警告您其名称已小写。这是因为DOM不区分大小写


###Bindable Properties 可绑定的属性

VM类的任何属性或功能都可以用于在自定义元素的视图内进行绑定；但是，自定义元素必须指定可绑定为自定义元素上属性的属性。
这是通过用装饰bindable器装饰每个可绑定属性来完成的

通过将设置对象传递给bindable带有名称为defaultBindingModeset 的属性的装饰器来覆盖此默认值。
此属性应设置为四个一个bindingMode选项：oneTime，fromView，toView/ oneWay或twoWay。
二者bindable并bindingMode可以从被导入aurelia-framework模块

secret-message.js
````
import {bindable, bindingMode} from 'aurelia-framework';
  
  export class SecretMessageCustomElement {
    @bindable({ defaultBindingMode: bindingMode.twoWay }) message;
    @bindable allowDestruction = false;
  
    constructor() {
      setInterval(() => this.deleteMessage(), 10000);
    }
  
    deleteMessage() {
      if(this.allowDestruction === true) {
        this.message = '';
      }
    }
  }
````

### Declarative Computed Values 声明式计算值

@ComputedFrom
````
// Or with getter and `computedFrom` decorator
  export class App {
    @bindable firstName;
    @bindable lastName;
  
    @computedFrom('firstName', 'lastName')
    get fullName() {
      return `${this.firstName} ${this.lastName}`;
    }
  }
````

### Declarative Computed Values 替代行为

代理行为允许您在模板元素上为自定义元素添加属性，事件处理程序和绑定





















