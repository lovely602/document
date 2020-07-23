### 配置和启动

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

### 依赖注入

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
  
### 模板基础

一个简单的模板
````
<template>
    <div>Hello World!</div>
  </template>
````  

### 数据绑定

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