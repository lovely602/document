## 配置和启动

引导旧版浏览器
````
  <script src="jspm_packages/system.js"></script>
  <script src="config.js"></script>
  <script>
    SystemJS.import('aurelia-polyfills').then(function() {
      return SystemJS.import('webcomponents/webcomponentsjs/MutationObserver');
    }).then(function() {
      SystemJS.import('aurelia-bootstrapper');
    });
  </script>
````

标准启动配置
````
 export function configure(aurelia) {
    aurelia.use
      .standardConfiguration()
      .developmentLogging();
  
    aurelia.start().then(() => aurelia.setRoot());
  }

````
## 创建组件

UI组件由两部分组成：视图模型和视图。只需在自己的文件中创建每个零件。
两部分使用相同的文件名，但文件扩展名不同。例如：hello.js和hello.html
````
import {useView} from 'aurelia-framework';
  
  @useView('./hello.html')
  export class Hello {
    ...
  }
````


### 组件生命周期

组件具有明确的生命周期

1. constructor() -首先调用视图模型的构造函数
2. created(owningView: View, myView: View)-如果视图模型实现了created回调，则下一步将调用它。此时，还创建了视图，并且视图模型和视图都已连接到其控制器。
   创建的回调将接收“ owningView”的实例。这是在内部声明组件的视图。如果组件本身具有视图，则将第二个通过
3. bind(bindingContext: Object, overrideContext: Object)-然后在视图和视图模型上激活数据绑定。如果视图模型具有bind回调，则将在此时调用它。组件所绑定到的“绑定上下文”将首先传递。第二个“覆盖上下文”将被传递。覆盖上下文包含用于遍历父层次结构的信息，也可以用于添加组件要添加的任何上下文属性。应该注意的是，当视图模型实现了bind回调时，数据绑定框架将不会为视图模型的可绑定属性调用更改的处理程序，直到“下一次”更新这些属性。
   如果您需要对可绑定属性执行特定的后处理，请在实施bind 回调，您应该在回调本身内手动进行    
4. attached()-接下来，将组件附加到DOM（在文档中）。如果视图模型具有attached回调，则将在此时调用它
5. detached()-在将来的某个时候，该组件可能会从DOM中删除。如果/当发生这种情况，并且如果视图模型具有detached回调，则将在该时间调用它    
6. unbind()-组件分离后，通常是未绑定的。如果您的视图模型具有unbind回调，则将在此过程中调用它

## 依赖注入

声明依赖项
````
import {inject} from 'aurelia-framework';
  import {Dep1} from 'dep1';
  import {Dep2} from 'dep2';
  
  @inject(Dep1, Dep2)
  export class CustomerDetail {
    constructor(dep1, dep2) {
      this.dep1 = dep1;
      this.dep2 = dep2;
    }
  }

````

使用解析器
````
import {Lazy, inject} from 'aurelia-framework';
  import {HttpClient} from 'aurelia-fetch-client';
  
  @inject(Lazy.of(HttpClient))
  export class CustomerDetail {
    constructor(getHTTP){
      this.getHTTP = getHTTP;
    }
  }

````

可用的解析器

- Lazy -注入用于延迟评估依赖关系的函数。
  - 例如 Lazy.of(HttpClient)
- All -注入使用提供的密钥注册的所有服务的数组。
  - 例如 All.of(Plugin)
- Optional-仅在容器中已经存在类的实例时才注入它；否则为null。
  - 例如 Optional.of(LoggedInUser)
- Parent -跳过从当前容器开始的依赖关系解析，而是开始在父容器上进行查找过程。
  - 例如 Parent.of(MyCustomElement)
- Factory -用于允许注入依赖项，还可以将数据传递给构造函数。
  - 例如 Factory.of(CustomClass)
- NewInstance -用于注入依赖项的新实例，而不考虑容器中的现有实例。
  - 例如 NewInstance.of(CustomClass).as(Another)
  
## 模板基础

一个简单的模板
````
<template>
    <div>Hello World!</div>
  </template>
````  

## 数据绑定

绑定，单向，双向和一次性

在任何HTML属性上使用

- .bind-使用默认绑定。除窗体控件外，所有控件都采用单向绑定，而表单控件则使用双向绑定。
- .one-way -沿一个方向流动数据：从视图模型到视图。
- .two-way -双向流动数据：从视图模型到视图以及从视图到视图模型。
- .one-time -一次渲染数据，但在初始渲染后不同步更改

### 委托，触发

用于任何本机或自定义DOM事件。（不要在事件名称中包括“ on”前缀。）

- .trigger-将事件处理程序直接附加到元素。事件触发时，将调用表达式。
- .delegate -将单个事件处理程序附加到处理指定类型的所有事件的文档（或最近的阴影DOM边界），并将其正确分派回其原始目标以调用关联的表达式。

### 呼叫

传递函数引用

````
<template>
    <button my-attribute.call="sayHello()">Say Hello</button>
</template>
````

### 参考

创建对HTML元素，组件或组件的零件的引用

- ref="someIdentifier"或element.ref="someIdentifier"-在DOM中创建对HTMLElement的引用。
- attribute-name.ref="someIdentifier"-创建对自定义属性的视图模型的引用。
- view-model.ref="someIdentifier"-创建对自定义元素的视图模型的引用。
- view.ref="someIdentifier"-创建对自定义元素的视图实例（不是HTML元素）的引用。
- controller.ref="someIdentifier"-创建对自定义元素的控制器实例的引用

### 字符串插值

用于元素的内容。可以在属性内部使用，在class和css属性中特别有用

````
<template>
    <span>${fullName}</span>
    <div class="dot ${color} ${isHappy ? 'green' : 'red'}"></div>
</template>
````

### 绑定 style

将CSS字符串或对象绑定到元素的style属性。
在进行字符串插值时style，请使用属性的别名，css以确保您的应用程序与Internet Explorer兼容

````
样式绑定数据
 export class StyleData {
    constructor() {
      this.styleString = 'color: red; background-color: blue';
  
      this.styleObject = {
        color: 'red',
        'background-color': 'blue'
      };
    }
  }

样式绑定视图
  <template>
    <div style.bind="styleString"></div>
    <div style.bind="styleObject"></div>
  </template>
````

### 声明计算属性依赖项

````
import {computedFrom} from 'aurelia-framework';
  
  export class Person {
    firstName = 'John';
    lastName = 'Doe';
  
    @computedFrom('firstName', 'lastName')
    get fullName(){
      return `${this.firstName} ${this.lastName}`;
    }
  }
````

## 模板视图资源
- $this   :绑定上下文（视图模型）
- $parent :显式地从组合或重复模板中访问外部作用域，当当前作用域上的属性覆盖了外部作用域的属性时，可能需要这样做。例如支持：$parent.$parent.foo
- $event  :绑定dom事件
- $index -数组中项目的索引。
- $first -如果该项是数组中的第一项，则为true。
- $last -如果该项是数组中的最后一项，则为True。
- $even -如果项目的索引号为偶数，则为true。
- $odd -如果项目的索引编号为奇数，则为true

### 有条件地显示html元素

````
<template>
    <div show.bind="isSaving" class="spinner"></div>
  </template>
````

### 有条件地添加/删除HTML元素
````
<template>
    <div if.bind="isSaving" class="spinner"></div>
  </template>
````    

### 使用模板渲染数组
````
<template>
    <ul>
      <li repeat.for="customer of customers">${customer.fullName}</li>
    </ul>
  </template>
````

### 使用模板渲染map地图
````
<template>
    <ul>
      <li repeat.for="[id, customer] of customers">${id} ${customer.fullName}</li>
    </ul>
</template>
````

### 根据数据将UI动态呈现到DOM中
````
  <template repeat.for="item of items">
    <compose model.bind="item" view-model="widgets/${item.type}"></compose>
  </template>
````

### 仅组成视图，继承父绑定上下文
````
<template repeat.for="item of items">
    <compose view="my-view.html"></compose>
  </template
````

### 用视图组成一个现有的对象实例

````
<template>
    <div repeat.for="item of items">
      <compose view="my-view.html" view-model.bind="item">
    </div>
  </template>
````

## 路由

### 基本路由配置

````
 export class App {
    configureRouter(config, router) {
      this.router = router;
      config.title = 'Aurelia';
      config.map([
        { route: ['', 'home'],       name: 'home',       moduleId: 'home/index' },
        { route: 'users',            name: 'users',      moduleId: 'users/index',   nav: true },
        { route: 'users/:id/detail', name: 'userDetail', moduleId: 'users/detail' },
        { route: 'files*path',       name: 'files',      moduleId: 'files/index',   href:'#files',   nav: true }
      ]);
    }
  }
````

### 路线模式选项

- 静态路线
  - 即'home'-完全匹配字符串
- 参数化路线
  - 即'users /：id / detail'-匹配字符串，然后解析id参数。您的视图模型的activate回调将使用一个对象进行调用，该对象的id属性设置为从url提取的值
- 通配符路由
  - 即'files * path'-匹配字符串，然后匹配字符串之后的任何内容。您的视图模型的activate回调将使用具有path设置为通配符值的属性的对象来调用    
  
### 路线屏幕激活生命周期

- canActivate(params, routeConfig, navigationInstruction)-如果要控制是否可以将视图模型导航到，请实现此挂钩。返回一个布尔值，一个布尔值的承诺或一个导航命令
- activate(params, routeConfig, navigationInstruction)-如果要在显示视图模型之前执行自定义逻辑，请实现此挂钩。您可以选择返回一个诺言，告诉路由器等待绑定并附加视图，直到完成工作
- canDeactivate()-如果要控制路由器在移至新路线时是否可以从视图模型中导航，请实施此挂钩。返回一个布尔值，一个布尔值的承诺或一个导航命令
- deactivate()-如果要在离开视图模型时执行自定义逻辑，请实现此钩子。您可以选择返回一个诺言，告诉路由器等到完成工作

### 生成路线url

用代码生成路由URL
````
router.generate('routeName', { id: 123 });
````

导航到生成的路线
````
 router.navigateToRoute('routeName', { id: 123 })

````  
渲染路线的锚点
````
<template>
    <a route-href="route: routeName; params.bind: { id: user.id }">${user.name}</a>
</template>
````
绕过路由器进行链接
````
<template>
    <a href="/my-page" router-ignore>Click to load my-page from server</a>
  </template>
````

## 自定义属性

简单属性声明
````
import {inject, customAttribute, DOM} from 'aurelia-framework';
  
  @customAttribute('my-attribute')
  @inject(DOM.Element)
  export class Show {
    constructor(element) {
      this.element = element;
    }
  
    valueChanged(newValue, oldValue) {
      ...
    }
  }
````

## 自定义元素

### 自定义元素
自定义元素视图模型声明
````
  import {customElement, bindable} from 'aurelia-framework';
  
  @customElement('say-hello')
  export class SayHello {
    @bindable to;
  
    speak(){
      alert(`Hello ${this.to}!`);
    }
  }
````
自定义元素视图声明
````
<template>
      <button click.trigger="speak()">Say Hello To ${to}</button>
  </template>
````
自定义元素的使用
````
<template>
    <require from="say-hello"></require>
  
    <input type="text" ref="name">
    <say-hello to.bind="name.value"></say-hello>
  </template>
````
### 没有视图模型声明的自定义元素

声明不带绑定视图模型的自定义元素
````
<template bindable="greeting,name">
      Say ${greeting} To ${name}
  </template>
````
添加没有视图模型的全局自定义元素
````
aurelia.use.globalResources('./js-less-component.html');
````

在不使用视图模型的情况下使用自定义元素
````
<require from="./js-less-component.html"></require>
  
<js-less-component greeting="Hello" name.bind="someProperty"></js-less-component>
````

### 自定义元素选项
- @children(selector)-装饰一个属性以在您的类上创建一个数组，该数组的项将基于查询选择器针对元素的直接子内容自动同步。与不兼容@containerless()
- @child(selector)-装饰属性以创建对单个直接子内容元素的引用。与不兼容@containerless()
- @processContent(false|Function)-告知编译器元素的内容需要特殊处理。如果提供false给装饰器，则编译器将不会处理自定义元素的内容。预计您将自己进行自定义处理。但是，您还可以提供一个自定义函数，该函数可让您在视图的编译过程中处理内容。然后，该函数可以返回true / false，以指示编译器是否也应该处理内容。该函数采用以下形式function(compiler, resources, node, instruction):boolean
- @useView(path) -指定要使用的其他视图
- @noView() -指示此自定义元素没有视图，并且作者打算使该元素在内部处理其自己的呈现
- @inlineView(markup, dependencies?) -允许开发人员提供一个将被编译到视图中的字符串
- @useShadowDOM(options?: { mode: 'open' | 'closed' })-使视图在ShadowDOM中呈现。将元素渲染为ShadowDOM时，DOMBoundary可以选择将特殊实例注入到构造函数中。这代表阴影根。与不兼容@containerless()
- @containerless()-使元素的视图在没有自定义元素容器包装的情况下呈现。这不能与结合使用@child，@children或@useShadowDOM装饰器。它也不能与替代行为一起使用。谨慎使用

### 可观察的装饰器

Aurelia公开了一个名为observable的装饰器，以允许监视属性的更改并对其做出反应。按照约定，它将查找匹配的方法名称Changed
````
import {observable} from 'aurelia-framework';
  
  export class MyCustomViewModel {
    @observable name = 'Hello world';
    nameChanged(newValue, oldValue) {
      // react to change
    }
  }
````

## 事件汇总器

在频道上发布
````
 import {inject} from 'aurelia-framework';
  import {EventAggregator} from 'aurelia-event-aggregator';
  
  @inject(EventAggregator)
  export class APublisher {
    constructor(eventAggregator) {
      this.eventAggregator = eventAggregator;
    }
  
    publish(){
      var payload = {};
      this.eventAggregator.publish('channel name here', payload);
    }
  }
````

订阅频道
````
 import {inject} from 'aurelia-framework';
  import {EventAggregator} from 'aurelia-event-aggregator';
  
  @inject(EventAggregator)
  export class ASubscriber {
    constructor(eventAggregator) {
      this.eventAggregator = eventAggregator;
    }
  
    subscribe() {
      this.eventAggregator.subscribe('channel name here', payload => {
          ...
      });
    }
  }

````



















