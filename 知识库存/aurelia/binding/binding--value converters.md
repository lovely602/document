## Value Converters 值转换器

在Aurelia中，用户界面元素由视图和视图模型对组成。视图是用HTML编写的，并呈现到DOM中。视图模型是用JavaScript编写的，并向视图提供数据和行为。
Aurelia强大的数据绑定将这两部分链接在一起，使您的数据更改能够反映在视图中，反之亦然

使用bind（.bind="expression"）和插值（${expression}）技术的简单数据绑定示例

simple-binding.js
````
export class Person {
    name = 'Donald Draper';
}
````
simple-binding.html
````
<template>
    <label for="name">Enter Name:</label>
    <input id="name" type="text" value.bind="name">
    <p>Name is ${name}</p>
  </template>
````

### Value Converters

- Aurelia ValueConverter接口使用toView和fromView方法，这使数据流向哪个方向非常清楚。这与IValueConverter使用Convert和的Xaml相对ConvertBack。
- 在Aurelia中，转换器参数可以是数据绑定的。这是Xaml中缺少的，它可以实现更高级的绑定方案。
- Aurelia值转换器方法可以接受多个参数。
- 可以使用管道（|）构成多个值转换器。
- Aurelia值转换器可以具有一个名为的类字段signals，该类字段接受将用于手动触发更新视图的字符串数组。这用于处理值转换器依赖于Aurelia应用程序之外定义的变量（例如语言，语言环境等）的情况

### Simple Converters

Aurelia和流行的 Moment 和 Numeral 库将负责繁重的工作，我们只需要整理一下内容即可

Moment.js和Numeral.js 是 JavaScript 日期处理类库,用于解析、检验、操作、以及显示日期

currency-format.js
````
import numeral from 'numeral';
  
  export class CurrencyFormatValueConverter {
    toView(value) {
      return numeral(value).format('($0,0.00)');
    }
}
````
date-format.js
````
import moment from 'moment';
  
  export class DateFormatValueConverter {
    toView(value) {
      return moment(value).format('M/D/YYYY h:mm:ss a');
    }
  }
````

### Converter Parameters

转换器参数不必是文字值。您可以绑定参数值以获得动态结果

数字格式.js
````
import numeral from 'numeral';
  
  export class NumberFormatValueConverter {
    toView(value, format) {
      return numeral(value).format(format);
    }
}
````
binding-converter-parameters.html
````
  <template>
    <require from="./number-format"></require>
  
    <label for="formatSelect">Select Format:</label>
    <select id="formatSelect" ref="formatSelect">
      <option value="$0,0.00">$0,0.00</option>
      <option value="$0.0a">$0.0a</option>
      <option value="0.00000">0.00000</option>
    </select>
  
    ${netWorth | numberFormat:formatSelect.value}
  </template>
````

### Bi-directional Value Converters 双向值转换器

- toView方法发挥作用的地方，它将元素的值转换为视图期望的格式
- fromView方法发挥作用的地方，它将元素的值转换为视图模型期望的格式

### Globally Accessible Value Converters 全局可访问的价值转换器

在所有示例中，我们一直在使用require元素将所需的转换器导入视图。有一种更简单的方法。
如果您想使某些通用的值转换器在全局范围内可用，请使用Aurelia的globalResources功能进行注册。
这将消除require每个视图顶部对元素的需求
















