## Computed Properties 计算属性

有时在访问属性时希望返回动态计算的值，或者您可能希望反映内部变量的状态而无需使用显式方法调用。
在JavaScript中，这可以通过使用getter来完成

计算属性，脏检查
````
export class Person {
    firstName = 'John';
    lastName = 'Doe';
  
    get fullName() {
      return `${this.firstName} ${this.lastName}`;
    }
  }

````

脏检查意味着绑定系统将定期检查属性的值是否发生更改，并根据需要更新视图。
这意味着您的属性的getter函数将执行多次，大约每120毫秒执行一次。
在大多数情况下，这不是问题，但是，如果您使用大量的计算属性，
或者如果getter函数足够复杂，则可能需要考虑给绑定系统提示要观察的内容，以使它不起作用。无需使用脏检查

### @computedFrom

@computedFrom告诉绑定系统要观察哪些表达式。当这些表达式更改时，绑定系统将重新评估属性（执行getter）。
这样就无需进行脏检查，并可以提高性能

````
import {computedFrom} from 'aurelia-framework';
  
  export class Person {
    firstName = 'John';
    lastName = 'Doe';
  
    @computedFrom('firstName', 'lastName')
    get fullName() {
      return `${this.firstName} ${this.lastName}`;
    }
  }
````

