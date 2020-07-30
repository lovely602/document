## class and style

### class

class使用字符串插值或使用.bind/ 绑定元素的属性.to-view
````
<template>
    <div class="foo ${isActive ? 'active' : ''} bar"></div>
    <div class.bind="isActive ? 'active' : ''"></div>
    <div class.one-time="isActive ? 'active' : ''"></div>
</template>
````

### style

将CSS字符串或对象绑定到元素的style属性。

css在视图中进行字符串插值时，请使用自定义属性，

如果您不使用插值法css-将不会对其进行处理

样式绑定数据
````
 export class StyleData {
    constructor() {
      this.styleString = 'color: red; background-color: blue';
  
      this.styleObject = {
        color: 'red',
        'background-color': 'blue'
      };
    }
  }
````

样式绑定视图
````
<template>
    <div style.bind="styleString"></div>
    <div style.bind="styleObject"></div>
</template>
````

非法样式插值
````
<template>
    <div style="width: ${width}px; height: ${height}px;"></div>
</template>
````

法律风格插补
````
<template>
    <div css="width: ${width}px; height: ${height}px;"></div>
</template>
````

没有插值就无法工作
````
<template>
    <div css="width: 100px; height: 100px;"></div>
</template>
````