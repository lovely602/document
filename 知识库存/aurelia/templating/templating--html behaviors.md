## html-behaviors

Aurelia模板引擎的自定义属性和自定义元素功能概述，不仅包括如何创建基本版本，
还包括如何在应用程序中本地和全局使用它们

### Introduction

Aurelia中的“ HTML行为”一词包含两个基本概念：自定义元素和自定义属性。
HTML行为几乎是每个Aurelia应用程序的基本组成部分。它们有助于使用高度可重用的代码创建组件化的应用程序

### What is an HTML Behavior?

HTML行为是您如何在Aurelia应用程序中使用自定义元素和自定义属性扩展HTML的方法

HTML行为（有一个例外）要求您为该行为创建一个类。对于自定义元素和自定义属性，此类都称为“ ViewModel”。
自定义元素的ViewModel通常与HTML“视图”配对。自定义属性的ViewModel没有与视图配对

Aurelia为类提供了一种命名约定，使您可以告诉框架类是用于Custom Element或Custom Attribute的ViewModel。
该命名约定非常简单：在ViewModel的名称后追加CustomElement或CustomAttribute命名

- 自定义元素为默认
  - 实际上，您甚至不需要追加CustomElement到一个类即可将其变成自定义元素。
  这样做的原因是，如果Aurelia无法匹配任何其他约定，并且找不到任何显式配置，则它将假定该类是自定义元素
  
如果您为HTML Behavior的类使用命名约定，则Aurelia将使用该类的名称来确定您的行为在HTML视图中的名称。
JavaScript类的标准命名约定为InitCaps，表示您每个单词都以大写字母开头；但是，HTML不区分大小写，通常将其标准化为小写

````
import {customAttribute} from 'aurelia-framework';
  
  @customAttribute('red-square')
  export class BlueSquare {
  }
````  

### Getting the DOM Element for your Behavior

Aurelia为您提供了一种非常简单的方法来获取对与Behavior关联的元素的引用：只需将其注入到ViewModel中即可

当您告诉Aurelia将Element类的实例注入到您的类中时，Aurelia将注入与HTML行为相关联的DOM元素

````
import {inject} from 'aurelia-framework';
  
  @inject(Element)
  export class RedSquareCustomAttribute {
    constructor(element){
      this.element = element;
  
      this.element.style.width = this.element.style.height = '100px';
      this.element.backgroundColor = 'red';
    }
  }
````

### Making an HTML Behavior Available in a View

默认情况下，HTML行为（和其他视图资源）在全局上不可用。
这意味着您必须让Aurelia知道每个视图中将提供哪些资源。这是使用require元素完成的


该require元素有两个属性from和as。您必须提供from属性的值，而as可选

- from属性：可以相对于应用程序的根目录，也可以相对于您当前所在的视图的路径。
不具有./或../以该路径开头的路径将相对于应用程序的根目录，而具有./或../将相对于视图路径的路径

- as 属性：通过Aurelia约定，通过在资源中进行显式命名或通过使用as属性进行覆盖。
如果您恰巧使用了多个具有相同名称的资源，则必须为一个as冲突资源（除了其中之一）提供属性值

````
<template>
    <require from="my-custom-element-one"></require>
    <require from="../another-dir/my-custom-element-one" as="override-the-name"></require>
  
    <my-custom-element-one></my-custom-element-one>
    <override-the-name></override-the-name>
  </template>
````

### Global Resources

在开发Aurelia应用程序时，您可能会拥有某些资源，可在多个视图中使用

通常，这是在main.js文件（或称为应用程序启动文件）的应用程序启动时完成的。
FrameworkConfiguration类提供的globalResources那样的把一个或多个字符串是路径的资源作为参数

您用于配置Aurelia的文件将提供一种configure方法。Aurelia将调用此方法，并将Aurelia类的实例传递给它。
此类提供了一个流畅的接口，用于FrameworkConfiguration通过其use属性访问对象。
FrameworkConfiguration对象上的方法返回该FrameworkConfiguration对象，以使您可以将多个调用链接在一起，如下所示
````
请注意，关于文件扩展名的相同规则（仅针​​对仅HTML的自定义元素包括该规则）适用于传递到的路径globalResources。
您可以全球化您将使用该require元素的任何内容，包括自定义元素，仅HTML的自定义元素，自定义属性，值转换器和绑定行为
````    

### Creating Bindable Properties on an HTML Behavior

当你把@bindable装饰在您的视图模型的属性，
现在奥里利亚将允许您绑定使用所有绑定命令奥里利亚提供此属性（bind，two-way，one-way，one-time，等）

greet-customer.js
````
  import {bindable} from 'aurelia-framework';
  
  export class GreetCustomerCustomElement {
    @bindable customerName = '';
  }
````
greet-customer.html
````
<template>
    Welcome to Pizza Planet, ${customerName}!
  </template>
````
绑定到自定义元素

````
<template>
    <require from="./greet-customer"></require>
  
    <greet-customer customer-name.bind="name"></greet-customer>
  </template>
````

页面的name属性将绑定到customerName“ greet-customer自定义元素” 的属性。
- 请注意，前面提到的将JavaScript名称转换为小写字母的约定适用于可绑定的属性名称

默认情况下，可绑定属性仅允许one-way数据绑定。这意味着数据会流进的HTML行为，而不是出于自定义元素。

可以通过将配置对象传递给@bindable装饰器，并将其名称defaultBindingMode设置为bindingMode枚举值之一的属性，将其显式化，从而使其变得明确
````
import {bindable, bindingMode} from 'aurelia-framework';
  
  export class GreetCustomerCustomElement {
    @bindable({ defaultBindingMode: bindingMode.twoWay }) customerName = '';
  }
````

在@bindable做单值使用自定义属性绑定，因为所有属性都有一个装饰时不使用value默认属性。
这是由Aurelia保证的。相反，我们实现了valueChangedAurelia调用的回调函数，以提醒我们自定义属性的绑定值已更改。
Aurelia将值设置value为“自定义属性”的ViewModel的属性，并将两个参数传递给valueChanged回调：新值和旧值  

````
import {inject} from 'aurelia-framework';
  
  @inject(Element)
  export class SquareCustomAttribute {
    constructor(element){
      this.element = element;
      this.element.style.width = this.element.style.height = '100px';
    }
  
    valueChanged(newValue, oldValue){
      this.element.style.backgroundColor = newValue;
    }
  }
````

### HTML-Only Custom Elements

即所有HTML行为必须具有JavaScript类才能充当ViewModel，这是一个例外，但我们从未仅解释该例外是什么。
HTML Only Custom Elements是唯一的例外。Aurelia使您无需创建ViewModel类即可创建自定义元素

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
  
    <hello-world first-name.bind="firstName" last-name.two-way="lastName"></hello-world>
  </template>
````

### HTML Behavior Lifecycle

所有HTML行为都有明确定义的生命周期。
使用此生命周期，您可以点击并触发代码以在适当的时候运行。下面是标准生命周期回调的列表

- constructor() -首先调用视图模型的构造函数
- created(owningView: View, myView: View)-如果视图模型实现了created回调，则下一步将调用它。如果您的行为是自定义元素，则它的视图也已创建，并且视图模型和视图都已连接到其控制器。
创建的回调将接收“ owningView”的实例。这是在内部声明组件的视图。如果组件本身具有视图，则将第二个通过
- bind(bindingContext: Object, overrideContext: Object)-然后在视图和视图模型上激活数据绑定。
如果视图模型具有bind回调，则将在此时调用它。组件所绑定到的“绑定上下文”将首先传递。
第二个“覆盖上下文”将被传递。覆盖上下文包含用于遍历父层次结构的信息，也可以用于添加组件要添加的任何上下文属性。
应该注意的是，当视图模型实现了bind回调时，数据绑定框架将不会为视图模型的可绑定属性调用更改的处理程序，直到“下一次”更新这些属性。
如果您需要对可绑定属性执行特定的后处理，请在实施bind 回调，您应该在回调本身内手动进行。
- attached()-接下来，将组件附加到DOM（在文档中）。如果视图模型具有attached回调，则将在此时调用它
- detached()-在将来的某个时候，该组件可能会从DOM中删除。如果/当发生这种情况，并且如果视图模型具有detached回调，则将在该时间调用它
- unbind()-组件分离后，通常是未绑定的。如果您的视图模型具有unbind回调，则将在此过程中调用它

重要的是要注意，如果实现bind回调函数，则在bindable初始设置属性值时，将不会为任何属性调用属性更改的回调。
绑定值更改的任何后续时间将调用更改后的回调






