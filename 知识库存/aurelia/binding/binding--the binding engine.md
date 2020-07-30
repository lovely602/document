## The Binding Engine

数据绑定如何在Aurelia中工作

### 注入绑定引擎

BindingEngine通过将实例注入到Aurelia应用程序内的任何类中来检索实例
````
  import { BindingEngine } from 'aurelia-framework'; // or 'aurelia-binding'
  
  export class MyViewModel {
  
    static inject() {
      return [BindingEngine]
    }
  
    constructor(bindingEngine) {
      //
    }
  }
````

### Observing a property on an object 观察属性

propertyObserver(obj, propertyName)返回PropertyObserver带有公共方法的对象，该方法subscribe可以像以下示例一样使用：

````
bindingEngine
      .propertyObserver(myObject, 'myObjectPropertyName')
      .subscribe((newValue, oldValue) => {
        // handle value change here
      });
````

### Observing a collection mutation 观察集合

collectionObserver(collection)返回CollectionObserver带有公共方法的对象，该方法subscribe可以像以下示例一样使用

````
bindingEngine
      .collectionObserver(myCollection)
      .subscribe((splice) => {
        // do something with the mutated collection
      })
````    

### Observing an expression on an object 表达式观察

expressionObserver(obj, expressionString)用来创建一个观察者，当路径中的任何属性expressionString被更改时，它都会通知您，例如以下示例：

````
bindingEngine
      .expressionObserver(this, 'project.name')
      .subscribe((newProjectName, oldProjectName) => {
        // do something with the new project name value
      });
````





















