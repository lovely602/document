## Delegate vs Trigger 委托与触发

几个常见的问题是：

- 委托和触发器之间有什么区别？
- 什么时候应该使用委托，什么时候应该使用触发器？

简短的答案是：使用，delegate除非不能使用delegate。

事件委托是一种用于提高应用程序性能的技术。通过利用大多数DOM事件的“冒泡”特性，它大大减少了事件订阅的数量。使用事件委托，处理程序不会附加到单个元素。而是将单个事件处理程序附加到顶级节点（例如body元素）。
当事件冒泡到此共享的顶级处理程序时，事件委托逻辑将根据事件的target调用适当的处理程序

只有冒泡的事件才能与Aurelia的delegate绑定命令一起使用。

事件blur，focus，load和unload事件不冒泡，所以你需要使用trigger绑定命令来订阅这些事件

### Event delegation with Capture  使用Capture进行事件委派

在大多数情况下，delegate并trigger有足够你来处理用户交互。
然而，delegate和trigger可有时来不及对事件作出反应。
在其他时候，事件可能永远不会传到您delegate或您的trigger处理程序中，
当您与第3方插件生成的内容（元素）进行交互时就是这种情况

````
<div class='my-plugin-container' click.capture='onClickPluginContainer()'>
    <!--
      Content inside here is generated by a plugin
      That will call `event.stopPropagation()` on any click events
    -->
</div>
````

