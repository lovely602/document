## Introduction 
Aurelia数据绑定的基础

## HTML and SVG Attributes

Aurelia支持将HTML和SVG属性绑定到JavaScript表达式。
属性绑定声明分为三个部分，形式为attribute.command="expression"

- attribute：HTML或SVG属性名称。
- command：Aurelia的属性绑定命令之一：
  - one-time：流数据中的一个方向，从视图模型的视图，一次。
  - to-view/ one-way：从视图模型到视图的一个方向流动数据。
  - from-view：从视图到视图模型一个方向流动数据。
  - two-way：从视图模型到视图以及从视图到视图模型的两种数据流向。
  - bind：自动选择绑定模式。对表单控件使用双向绑定，对几乎所有其他内容都使用查看绑定。
- expression：JavaScript表达式
````
<input type="text" value.bind="firstName">
<input type="text" value.two-way="lastName">
<input type="text" value.from-view="middleName">

<a class="external-link" href.bind="profile.blogUrl">Blog</a>
<a class="external-link" href.to-view="profile.twitterUrl">Twitter</a>
<a class="external-link" href.one-time="profile.linkedInUrl">LinkedIn</a>
````

## DOM Events

绑定系统支持绑定到DOM事件。每当发生指定的DOM事件时，DOM事件绑定将执行JavaScript表达式。
事件绑定声明包含三个部分：event.command="expression"

- event：DOM事件的名称，不带“ on”前缀。
- command：Aurelia的事件绑定命令之一：
  - trigger：将事件处理程序直接附加到元素。事件触发时，将调用表达式。
  - delegate：将单个事件处理程序附加到文档（或最近的阴影DOM边界），该事件处理程序在冒泡阶段处理指定类型的所有事件，并将其正确分派回其原始目标以调用关联的表达式。
  - capture：将单个事件处理程序附加到文档（或最近的阴影DOM边界），该事件处理程序将在捕获阶段处理指定类型的所有事件，并将其正确分派回其原始目标以调用关联的表达式。
- expression：JavaScript表达式。使用特殊$event属性访问绑定表达式中的DOM事件

Aurelia将在delegate和trigger事件处理时会自动调用preventDefault()方法。
大多数时，这个行为是你想做的。在你的事件处理函数中返回true可以关闭

````
<button type="button" click.trigger="cancel()">Cancel</button>
  
<button type="button" click.delegate="select('yes')">Yes</button>
<button type="button" click.delegate="select('no')">No</button>

<input type="text" blur.trigger="elementBlurred($event.target)">
<input type="text" change.delegate="lastName = $event.target.value">
````

## Function References

在开发自定义元素或自定义属性时，您可能会遇到一种情况，即您拥有一个@bindable期望引用函数的属性。
使用callbinding命令声明一个函数并将其传递给bindable属性。
该call命令优于bind该用例的命令，因为它将在正确的上下文中执行该功能，从而确保this达到您的期望

````
<my-element go.call="doSomething()"></my-element>
  
<input type="text" value.bind="taskName">
<my-element go.call="doSomething(taskName)"></my-element>
````

## Referencing Elements

使用refbinding命令创建对DOM元素的引用。
ref命令的最基本语法为ref="expression"。当视图是数据绑定的时，将为指定的表达式分配DOM元素

该ref命令具有几个限定词，可以与定制元素和属性一起使用：
- element.ref="expression"：创建对DOM元素的引用（与相同ref="expression"）
- attribute-name.ref="expression"：创建对自定义属性的视图模型的引用
- view-model.ref="expression"：创建对自定义元素的视图模型的引用
- view.ref="expression"：创建对自定义元素的视图实例（不是HTML元素）的引用
- controller.ref="expression"：创建对自定义元素的控制器实例的引用

## String Interpolation

可以在HTML属性中使用字符串插值作为to-view绑定的替代方法。默认情况下，插值绑定的模式为to-view，并且表达式的结果始终强制为字符串。
结果为null或undefined将导致为空字符串

````
<span textcontent.bind="'Hello' + firstName"></span>
  
<span>Hello ${firstName}</span>
````













