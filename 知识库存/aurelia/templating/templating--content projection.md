## Content Projection 内容投影

Aurelia模板引擎的自定义元素内容投影功能概述

### Introduction 

大多数标准HTML元素都允许在其中包含内容。如果我们不能在其中放置内容，则自定义元素的用途将受到限制。
因此，我们需要一种获取此内容并将其放置在自定义元素模板中的方法。Shadow DOM规范提供了slot执行此操作的处理指令

### Basic Content Projection 基本内容投影

Aurelia自定义元素利用Web组件规范中的“基于插槽”的内容投影标准

自定义元素利用了一个插槽，因此我们只需要<slot></slot>在模板中添加一个我们希望投影内容的元素

name-tag.html
````
<template>
    <div class="header">
      Hello, my name is
    </div>
    <div class="name">
      <slot></slot>
    </div>
  </template>
````
名称标签元素用法
````
<name-tag>
    Ralphie
  </name-tag>
````

### Named Slots 命名插槽

因为slot没有name属性。在Shadow DOM中，您可以创建任意数量的插槽，只要为其指定不同的名称即可。
然后，投影到Shadow DOM中的内容必须使用slot属性指定它想要的插槽。
如果它指示没有特定的插槽（或纯文本），它将被投影到默认插槽中

named-slot.html
````
<template>
    <div>
      The first slot:
      <div>
        <slot name="slot1"></slot>
      </div>
      The second slot:
      <div>
        <slot name="slot2"></slot>
      </div>
    </div>
  </template>
````
用法
````
<named-slot>
    <div slot="slot1">
      This Goes in Slot 1
    </div>
  
    <div slot="slot2">
      This Goes in Slot 2
    </div>
  </named-slot>
````
组成的视觉树
````
<named-slot>
    <div>
      The first slot:
      <div>
        <div slot="slot1">
          This Goes in Slot 1
        </div>
      </div>
      The second slot:
      <div>
        <div slot="slot2">
          This Goes in Slot 2
        </div>
      </div>
    </div>
  </named-slot>
````
### Fallback Slots 后备广告位

广告位的一个不错的功能是它们可以具有备用内容。如果没有任何内容投射到该插槽中，则该插槽将呈现其后备内容

fallback-content.html
````
<template>
    <div>
      The first slot:
      <div>
        <slot name="slot1"></slot>
      </div>
      The second slot:
      <div>
        <slot name="slot2">This is some fallback content for slot 2...</slot>
      </div>
    </div>
  </template>
````
用法
````
<fallback-content>
    <div slot="slot1">
      This Goes in Slot 1
    </div>
  </fallback-content>
````
组成的视觉树
````
<fallback-content>
    <div>
      The first slot:
      <div>
        <div slot="slot1">
          This Goes in Slot 1
        </div>
      </div>
      The second slot:
      <div>
        This is some fallback content for slot 2...
      </div>
    </div>
  </fallback-content>
````

### Slot Implementation Limitations 插槽实施限制

已知局限性如下

- 无法对插槽的name属性进行数据绑定
- 无法对slot属性进行数据绑定
- 不能在组件视图内动态生成slot元素






















