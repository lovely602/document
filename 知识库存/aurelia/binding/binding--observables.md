## Observables

### Observable Properties

要观察属性，您需要使用装饰器对其进行@observable装饰，并将一个方法定义为更改处理程序。

此方法可以接收2个参数：新值和旧值。您可以在此方法中放入任何业务逻辑

- 约定的方法
可观察的性质
````
import { observable } from 'aurelia-framework';
  
  export class Car {
    @observable color = 'blue';
  
    colorChanged(newValue, oldValue) {
      // this will fire whenever the 'color' property changes
    }
  }
````

- 非约定的方法

通过设置装饰器的changeHandler属性来定义更改处理程序的回调名称@observable

````
  import { observable } from 'aurelia-framework';
  
  export class Car {
    @observable({ changeHandler: 'myChangeHandler' })
    color = 'blue';
  
    myChangeHandler(newValue, oldValue) {
      // this will fire whenever the 'color' property changes
    }
  }
````

### Observing Collections

使用集合观察者来观察对集合的更改。可以观察到的集合类型为 Array ， Map 和 Set 。
通过提供要观察的集合和回调函数来创建预订

````
import {BindingEngine} from 'aurelia-framework';
  
  @inject(BindingEngine)
  export class App {
  
    myCollection = ["foo"];
  
    constructor(bindingEngine) {
      let subscription = bindingEngine.collectionObserver(this.myCollection)
        .subscribe(this.collectionChanged.bind(this));
    }
  
    collectionChanged(splices) {
        // This will fire any time the collection is modified. 
    }
  }
````


















