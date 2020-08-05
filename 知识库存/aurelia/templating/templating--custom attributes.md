### Custom Attributes

Aurelia模板引擎的自定义属性功能概述。自定义属性用于向DOM元素添加自定义行为

### Introduction

自定义属性是视图资源的一类，就像值转换器，绑定行为和自定义元素一样。自定义属性提供了更改行为或向任何DOM元素添加功能的能力

### Simple Custom Attribute

要创建的最简单的自定义属性是仅通过添加到元素即可更改元素行为的属性。以下属性将使HTML元素显示为带有红色背景的100像素正方形

red-square.js
````
export class RedSquareCustomAttribute {
    static inject = [Element];
  
    constructor(element){
      this.element = element;
      this.element.style.width = this.element.style.height = '100px';
      this.element.style.backgroundColor = 'red';
    }
  }
````
simple-attribute-usage.html
````
<template>
    <require from="./red-square"></require>
    <div red-square></div>
  </template>
````

属性名称是通过Aurelia约定来推断的。此约定${Name}CustomAttribute适用于ECMAScript类名。
类名采用“ init caps”格式。Aurelia将此格式转换为“破折号”格式，以用于HTML。因此，RedSquareCustomAttribute成为red-square

### Explicit Attribute Naming 显式属性命名

通过使用@customAttribute装饰器，可以覆盖默认的命名约定。为装饰器提供属性的确切名称，如下所示。
请注意，使用此装饰器时，Aurelia不会从“ init caps”转换为“ dash-case”。它使用传递给装饰器的确切值

red-square.js
````
import {customAttribute} from 'aurelia-framework';
  
  @customAttribute('red-square')
  export class MyClass {
    // implement custom element here
  }
````

### Single Value Binding 单值绑定

Aurelia定制属性支持三种不同类型的绑定：单值绑定，选项绑定和动态选项绑定。
三种绑定类型中最简单的是单值绑定。Aurelia将自动value在属性的ViewModel上设置属性。
请注意，直到完成数据绑定后才设置此属性。这意味着value将不会在自定义属性的构造函数或其created生命周期事件中设置该属性。
在bind及以后的生命周期事件中可用

square.js
````
export class SquareCustomAttribute {
    static inject = [Element];
  
    constructor(element){
      this.element = element;
      this.element.style.width = this.element.style.height = '100px';
    }
  
    bind() {
      this.element.style.backgroundColor = this.value;
    }
  }
````
````
<template>
    <require from="./square"></require>
  
    <div square="red"></div>
    <div square="${color}"></div>
    <div square.bind="color"></div>
  </template>
````

### Options Binding

选项绑定为自定义属性提供了具有多个可绑定属性的能力。必须使用bindable装饰器指定每个可绑定属性。
ViewModel属性可以${propertyName}Changed(newValue, oldValue)为每个可绑定属性实现可选的回调函数。
绑定到这些选项时，请使用分号分隔每个选项，并提供一个绑定命令或文字值，如下例所示。

- 当在DOM中使用可绑定属性时，可绑定属性会转换为破折号，而绑定到的ViewModel属性将保留其原始大小写

square.js
````
import {bindable, inject} from 'aurelia-framework';
  
  @inject(Element)
  export class SquareCustomAttribute {
    @bindable sideLength;
    @bindable color;
  
    constructor(element){
      this.element = element;
    }
  
    sideLengthChanged(newValue, oldValue){
      this.element.style.width = this.element.style.height = `${newValue}px`;
    }
  
    colorChanged(newValue, oldValue){
      this.element.style.backgroundColor = newValue;
    }
  }
````
选项绑定用法
````
<template>
    <require from="./square"></require>
  
    <div square="color.bind: squareColor; side-length.bind: squareSize"></div>
  </template>
````

### Default Option 默认选项

在选项绑定的所有选项中，可以将单个可绑定属性设置为默认属性。
因此，当您使用自定义属性，否则将需要使用选项HTML语法，并且只想为默认属性提供值或绑定，则可以使用单值绑定的简单HTML语法

使用选项绑定时，每个可绑定属性都必须使用装饰bindable器进行装饰。
要指定您希望可绑定属性是所有其他可绑定属性中的默认属性，请使用装饰器的primaryProperty配置参数bindable，如下所示

square.js
````
import {bindable, inject} from 'aurelia-framework';
  
  @inject(Element)
  export class SquareCustomAttribute {
    @bindable sideLength;
    @bindable({ primaryProperty: true }) color;
  
    constructor(element){
      this.element = element;
    }
  }
````

- 使用选项语法绑定单个属性时的用法
````
<div square="color.bind: squareColor"></div>
````
- 在默认可绑定属性上使用更简单的绑定语法
````
<div square.bind="squareColor"></div>
````
- 在默认可绑定属性上使用更简单的语法
````
<div square="#123456"></div>
````

### Dynamic Options Binding

利用动态选项，自定义属性可以处理可绑定属性，而在创建属性时该属性的名称未知。
只需使用dynamicOptions装饰器装饰属性的ViewModel 并实现propertyChanged(name, newValue, oldValue)回调函数。
Aurelia将提供已更改选项的名称以及该选项的新旧值

square.js
````
import {dynamicOptions, inject} from 'aurelia-framework';
  
  @dynamicOptions
  @inject(Element)
  export class SquareCustomAttribute {
    constructor(element){
      this.element = element;
    }
  
    propertyChanged(name, newValue, oldValue){
      switch(name){
        case 'fill':
          this.element.style.backgroundColor = newValue;
          break;
        case 'size':
          this.element.style.width = this.element.style.height = `${newValue}px`;
          break;
        default:
          this.element.style[name] = newValue;
          break;
      }
    }
  }
````

单值绑定用法
````
<template>
    <require from="./square"></require>
  
    <div square="fill.bind: squareColor; size: 100"></div>
  </template>
````
### Globally Accessible Custom Attributes 全局可访问的自定义属性

在所有示例中，我们一直在使用require元素将所需的自定义属性导入视图。有一种更简单的方法。
如果您想使某些通用的自定义属性在全球范围内可用，请使用Aurelia的globalResources函数进行注册。这将消除require对每个视图顶部的元素的需求










