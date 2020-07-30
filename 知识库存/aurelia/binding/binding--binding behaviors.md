## Binding Behaviors 绑定行为

Aurelia绑定引擎的绑定行为功能概述。绑定行为用于插入绑定实例的生命周期并更改其操作方式

###介绍

绑定行为和值转换器之间的主要区别在于，绑定行为在其整个生命周期中都具有对绑定实例的完全访问权限。
与此相比，值转换器只能拦截从模型传递到视图的值


### throttle 节流
Aurelia开箱即用地提供了一些行为,限制双向绑定中视图模型的更新速率或视图间绑定场景中视图的更新速率

默认情况下throttle将仅每200ms更新一次

````
最多每200ms更新一次属性
<input type="text" value.bind="query & throttle">
````

- &符号，该符号用于声明绑定行为表达式。绑定行为表达式使用与值转换器表达式相同的语法模式

- 绑定行为可以接受参数： firstName & myBehavior:arg1:arg2:arg3
- 绑定表达式可以包含多种绑定行为：firstName & behavior1 & behavior2:arg1。
- 绑定表达式还可以包含值转换器和绑定行为的组合：${foo | upperCase | truncate:3 & throttle & anotherBehavior:arg1:arg2}

最多每850ms更新一次属性
````
<input type="text" value.bind="query & throttle:850">
````

### debounce 防抖

防抖绑定行为是另一个速率限制绑定行为。防逗功能可以防止绑定被更新，直到经过指定的间隔而没有任何更改

常见的用例是自动触发搜索的搜索输入。您不想对每个更改（每次击键）都使用搜索API。
等到用户暂停键入以调用搜索逻辑后，效率更高

鼠标停止移动500毫秒后调用mouseMove
````
<div mousemove.delegate="mouseMove($event) & debounce:500"></div>
````
注：throttle与debounce的区别：
- throttles是设置绑定更新的间隔时间。
- debounce是设置某段间隔时间，在间隔时间内，值没有变化，就阻止绑定行为

### updateTrigger 更新触发器

更新触发器允许您重写导致元素值写入视图模型的输入事件。默认事件是change和input

失焦更新
````
<input value.bind="firstName & updateTrigger:'blur'>
````

### signal 信号

信号绑定行为使您可以“信号”绑定以刷新。当绑定结果受观察路径之外的全局更改影响时，此功能特别有用

例如，如果您有一个“翻译”值转换器，可以将键转换为本地化字符串（例如${'greeting-key' | translate}，您的站点允许用户更改当前语言），那么当绑定发生时如何刷新绑定？

使用signal绑定行为的方法如下：

使用信号
````
posted ${postDateTime | timeAgo & signal:'my-signal'}
````

使用BindingSignaler定期发出绑定信号的方法

绑定信令
````
import {BindingSignaler} from 'aurelia-templating-resources';
import {inject} from 'aurelia-framework';
  
  @inject(BindingSignaler)
  export class App {
    constructor(signaler) {
      setInterval(() => signaler.signal('my-signal'), 5000);
    }
  }
````

### oneTime

使用oneTime绑定行为，您可以指定字符串插值绑定应发生一次

````
<span>${foo & oneTime}</span>
````

### self

通过self绑定行为，您可以指定事件处理程序仅响应侦听器所附加到的目标，而不响应其后代

自我约束行为,该种行为不可用

````
  <panel>
    <header mousedown.delegate='onMouseDown($event)' ref='header'>
      <button>Settings</button>
      <button>Close</button>
    </header>
  </panel>
````
onMouseDown是您的事件处理程序，它不仅会在用户mousedown使用标头元素时被调用，
还会被其中的所有元素（在这种情况下为按钮settings和）调用close。
但是，这并不总是所需的行为。有时您希望组件仅在用户单击标题本身而不是按钮时才做出反应

使用自绑定行为
````
  <panel>
    <header mousedown.delegate='onMouseDown($event) & self'>
      <button class='settings'></button>
      <button class='close'></button>
    </header>
  </panel>
````

### Custom binding behaviors 自绑定行为

您可以构建自定义绑定行为，就像可以构建值转换器一样。
代替toView和fromView方法，您将创建bind(binding, scope, [...args])和unbind(binding, scope)方法。

在bind方法中，将行为添加到绑定中，在unbind方法中，应清除在bind方法中所做的所有操作，以将绑定实例恢复为原始状态。

该binding参数是绑定实例你想改变其行为。

这是Binding接口的实现。该scope参数是绑定的数据上下文。

它提供对绑定将通过其bindingContext和overrideContext属性绑定到的模型的访问

创建自定义绑定行为
````
const interceptMethods = ['updateTarget', 'updateSource', 'callSource'];
  
  export class InterceptBindingBehavior {
    bind(binding, scope, interceptor) {
      let i = interceptMethods.length;
      while (i--) {
        let method = interceptMethods[i];
        if (!binding[method]) {
          continue;
        }
        binding[`intercepted-${method}`] = binding[method];
        let update = binding[method].bind(binding);
        binding[method] = interceptor.bind(binding, method, update);
      }
    }
  
    unbind(binding, scope) {
      let i = interceptMethods.length;
      while (i--) {
        let method = interceptMethods[i];
        if (!binding[method]) {
          continue;
        }
        binding[method] = binding[`intercepted-${method}`];
        binding[`intercepted-${method}`] = null;
      }
    }
  }
  
````

使用自我绑定行为

````
<template>
    <require from="./intercept-binding-behavior"></require>
    
    <div mousemove.delegate="mouseMove($event) & intercept:myFunc"></div>
    
    <input value.bind="foo & intercept:myFunc">
</template>
````

