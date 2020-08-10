## Basic Configuration 基本配置

要使用Aurelia的路由器，您的组件视图必须包含一个<router-view></router-view>元素。

为了配置路由器，组件的视图模型需要一个configureRouter()功能

app.html
````
<template>
      <ul repeat.for="nav of router.navigation">
          <li class="${nav.isActive ? 'active' : ''}"><a href.bind="nav.href">${nav.title}</a></li>
      </ul>
      <router-view></router-view>
  </template>
````
基本路由配置
````
export class App {
    configureRouter(config, router) {
      this.router = router;
      config.title = 'Aurelia';
      config.map([
        { route: ['', 'home'],       name: 'home',       moduleId: 'home/index' },
        { route: 'users',            name: 'users',      moduleId: 'users/index', nav: true, title: 'Users' },
        { route: 'users/:id/detail', name: 'userDetail', moduleId: 'users/detail' },
        { route: 'files/*path',      name: 'files',      moduleId: 'files/index', nav: 0,    title: 'Files', href:'#files' }
      ]);
    }
  }
````

- config.map()将路由添加到路由器。虽然只是route，name，moduleId，href和nav示上面有可以被包括在一个路径的其它性质。
  路由的接口名称为RouteConfig。您也可以使用config.mapRoute()添加一条路线
- route  是与传入URL片段匹配的模式。它可以是字符串或字符串数​​组。该路由也可以包含参数化路由或通配符
  -  参数化的路由与带有:token参数的字符串匹配（即：“ users /：id / detail”）。
     具有令牌参数名称的对象被设置为属性，并作为参数传递给路由视图模型的activate()功能
  -  可以通过添加问号使参数成为可选参数:token?（即：users/:id?/detail将与users/3/detail和都匹配users/detail）。
     如果网址中缺少可选参数，则传递给的属性activate()为undefined
  -  通配符路由用于匹配路径的“其余”（即：files / * path匹配files / new / doc或files / temp）。
     该段之后具有URL其余部分的对象被设置为path属性，并且也作为参数传递给该对象activate()
- name -是一个友好的名称，可用于引用路由，尤其是在使用路由生成时
- moduleId -是模块的ID（通常是相对路径），该模块导出在匹配路线时应呈现的组件
- href-是有条件的可选属性。如果未定义，则使用路由。如果route有段，则如同文件一样需要href，因为路由器不知道如何填写模式的参数化部分
- nav-是布尔值或数字属性。设置为true时，路由将包含在路由器的导航模型中。当指定为数字时，该值将用于对路由进行排序。这样可以更轻松地创建动态菜单或类似元素。
  导航模型将以NavModelin的数组形式提供router.navigation。这些是以下项中的可用属性NavModel
  - isActive 标志，在关联的路由处于活动状态时为true    
  - title 当关联的路由处于活动状态时，它将以html标题开头
  - href可以在a标签上使用
  - config是中定义的对象config.map
  - settings等于属性settings的config对象
  - router 是AppRouter的参考
  - 其他属性包括relativeHref和order
- title-是要显示为文档标题的文本（显示在浏览器的标题栏或选项卡中）。它与router.title任何子路线的和标题结合在一起
- titleSeparator-是将用于连接title和和任何active route.title的文本。默认值为' | '  

#### 导航状态

路由器包含许多其他属性，这些属性指示路由器导航的当前状态。这些属性仅在基本路由器上设置，即不在子路由器上设置。
此外，这些属性都是关于浏览器历史记录的，这些历史记录超出了路由器本身的生命周期

- router.isNavigating：true如果路由器当前正在处理导航
- router.isNavigatingFirst：true如果路由器是第一次在浏览器会话中导航至应用程序
- router.isNavigatingNew：true如果路由器导航到浏览器会话历史记录中没有的页面实例。当用户单击链接或显式调用导航功能时，将触发此事件
- router.isNavigatingForward：true如果路由器正在浏览器会话历史记录中向前导航。当用户单击浏览器中的前进按钮时，将触发此操作
- router.isNavigatingBack：true如果路由器正在浏览器会话历史记录中导航。当用户单击浏览器中的“后退”按钮或navigateBack()调用该函数时，将触发此事件
- router.isNavigatingRefresh：true如果路由器由于浏览器刷新而正在导航
- router.isExplicitNavigation：true如果路由器由于显式调用导航功能而正在导航
- router.isExplicitNavigationBack：true如果路由器由于显式调用navigationBack函数而正在导航

#### Webpack配置

使用Webpack时，有必要帮助Aurelia创建可由加载程序解析的路径。这是通过用来包装moduleId字符串来完成的PLATFORM.moduleName()。

可以PLATFORM从aurelia-framework或aurelia-pal导入到项目中
````
import { PLATFORM } from "aurelia-framework";
  
  export class App {
    configureRouter(config, router) {
      config.map([
        { route: ['', 'home'],   name: 'home',    moduleId: PLATFORM.moduleName('home') }
      ]);
  
      this.router = router;
    }
  }
````
### Options 选件

#### 推送状态

设置config.options.pushState为true激活推送状态，并将 基本标记添加 到html文档的头部。
如果您使用的是JSPM，RequireJS或类似的模块加载器，则还需要使用与基本标记相对应的基本url配置它href。
最后，请确保将设置config.options.root为与基本标签的设置相匹配

推送状态
````
export class App {
    configureRouter(config, router) {
      this.router = router;
      config.title = 'Aurelia';
      config.options.pushState = true;
      config.options.root = '/';
      config.map([
        { route: ['', 'home'], name: 'home',  moduleId: 'home/index' },
        { route: 'users',      name: 'users', moduleId: 'users/index', nav: true, title: 'Users' }
      ]);
    }
  }
````

- PushState需要服务器端支持。此配置因服务器设置而异。
  - 如果您使用的是Webpack DevServer，则需要将devServer historyApiFallback选项设置为true。
  - 如果您使用的是ASP.NET Core，则需要调用routes.MapSpaFallbackRoute启动代码
  
### Dynamically Specify Route Components 动态指定路由组件

在路由中添加navigationStrategy，以允许动态路由.

在导航策略要求配置instruction.config的moduleId，viewPorts或redirect
````
export class App {
    configureRouter(config, router) {
      this.router = router;
      config.title = 'Aurelia';
      const navStrat = (instruction) => {
        instruction.config.moduleId = instruction.fragment
        instruction.config.href = instruction.fragment
      };
      config.map([
        { route: ['', 'home'],       name: 'home',  moduleId: 'home/index' },
        { route: 'users',            name: 'users', moduleId: 'users/index', nav: true, title: 'Users' },
        { route: ['', 'admin*path'], name: 'route', navigationStrategy: navStrat }
      ]);
    }
  }
````

### Adding Additional Data To A Route 向路线添加其他数据

Aurelia允许您将任何其他属性传递给路由的配置对象，但settings它是默认参数，您应向该参数添加要传递给路由的任意数据

Using Route Settings
````
export class App {
    configureRouter(config, router) {
      this.router = router;
      config.title = 'Aurelia';
      config.map([
        { route: ['', 'home'], name: 'home',  moduleId: 'home/index' },
        { route: 'users',      name: 'users', moduleId: 'users/index', nav: true, title: 'Users', settings: {data: '...'} }
      ]);
    }
  }
````

### Case Sensitive Routes 区分大小写的路由

````
export class App {
    configureRouter(config, router) {
      this.router = router;
      config.title = 'Aurelia';
      config.map([
        { route: ['', 'home'], name: 'home',  moduleId: 'home/index' },
        { route: 'users',      name: 'users', moduleId: 'users/index', nav: true, title: 'Users', caseSensitive: true }
      ]);
    }
  }
````

在上面的例子中，我们的路线将只匹配的网址片段/users，而不是/Users，但因为路线home是不区分大小写的URL /Home会匹配。
- 默认情况下，Aurelia的路由不区分大小写

### Handling Unknown Routes 处理未知路由

Aurelia允许您映射任何未知的路线。传递给的参数mapUnknownRoutes()可以是
- 一个指向moduleId的字符串。该模块将导航到找不到路线的任何时间
- 一个routeConfig对象。找不到路由时将使用此配置对象
- 传递给NavigationInstruction对象并可以动态确定路线的函数

#### 使用moduleId未知路线
````
静态未知路由

export class App {
    configureRouter(config, router) {
      this.router = router;
      config.title = 'Aurelia';
      config.map([
        { route: ['', 'home'], name: 'home',  moduleId: 'home/index' },
        { route: 'users',      name: 'users', moduleId: 'users/index', nav: true, title: 'Users' }
      ]);
  
      config.mapUnknownRoutes('not-found');
    }
  }
````

#### 对未知路由使用功能

传递给的函数mapUnknownRoutes()必须返回：

- 代表的字符串moduleId。
- 具有moduleId字符串类型属性的对象。
- 一个RouteConfig对象。
- 一个Promise解析到任何上述的参数
````
export class App {
    configureRouter(config, router) {
      this.router = router;
      config.title = 'Aurelia';
  
      const handleUnknownRoutes = (instruction) => {
          return { route: 'not-found', moduleId: 'not-found' };
      }
  
      config.mapUnknownRoutes(handleUnknownRoutes);
  
      config.map([
        { route: ['', 'home'], name: 'home',  moduleId: 'home/index' },
        { route: 'users',      name: 'users', moduleId: 'users/index', nav: true, title: 'Users' }
      ]);
    }
  }
````

### Redirecting Routes 重定向路线

通过使用包含URL片段的字符串指定重定向，Aurelia允许将路由重定向到URL片段

路由配置重定向
````
config.map([
    { route: '', redirect: 'home' },
    { route: 'home', name: 'home', moduleId: 'home/index' }
  ]);
````

- 在子路由器的空路由上使用重定向
  - redirect当您有一个“空”路由模式（例如上面的第一条路由）映射到带有子路由器的组件时 ，它特别有用。在这种情况下，创建一个非空路由，然后将空路由重定向到非空路由（如上所述）。这将使子路由器能够始终匹配子路由，而不会在匹配空路由的情况下产生混淆
  
### Pipelines   流水线

Aurelia有两个路由器类，AppRouter和Router。AppRouter扩展Router类，是主要的应用路由器。Router用于任何子路由器，包括嵌套子路由器

两者之间的主要区别之一是子路由器上不允许使用管道,仅在AppRouter允许使用pipeline

默认管道插槽的顺序是authorize，preActivate，preRender，和postRender。

对于每个插槽，aurelia具有便利的函数，用于创建用于这些时隙的管道步骤：addAuthorizeStep，addPreActivateStep，addPreRenderStep，addPostRenderStep。
您可以使用创建自己的管道步骤addPipelineStep，但步骤名称必须与默认管道的插槽之一匹配

- authorize在加载路径的步骤和调用路径视图模型的canActivate函数（如果已定义）之间被调用。
- preActivate如果已定义，则在路径视图模型的canActivate功能和先前路径视图模型的deactivate功能之间调用。
- preRender 在路径视图模型的激活功能之间以及渲染/组成组件之前调用。
- postRender 在渲染/合成组件后调用

pipeline步骤必须是对象或构造函数，它必须解析为包含run(navigationInstruction, next)函数的对象

授权步骤
````
import {Redirect} from 'aurelia-router';
  
  export class App {
    configureRouter(config) {
      config.addAuthorizeStep(AuthorizeStep);
      config.map([
        { route: ['', 'home'],       name: 'home',       moduleId: 'home/index' },
        { route: 'users',            name: 'users',      moduleId: 'users/index',  settings: { auth: true } },
        { route: 'users/:id/detail', name: 'userDetail', moduleId: 'users/detail', settings: { auth: true } }
      ]);
    }
  }
  
  class AuthorizeStep {
    run(navigationInstruction, next) {
      if (navigationInstruction.getAllInstructions().some(i => i.config.settings.auth)) {
        var isLoggedIn = // insert magic here;
        if (!isLoggedIn) {
          return next.cancel(new Redirect('login'));
        }
      }
  
      return next();
    }
  }
````

预激活步骤
````
export class App {
    configureRouter(config) {
      function step() {
        return step.run;
      }
      step.run = (navigationInstruction, next) => {
        return next();
      };
      config.addPreActivateStep(step)
      config.map([
        { route: ['', 'home'], name: 'home',  moduleId: 'home/index' },
        { route: 'users',      name: 'users', moduleId: 'users/index', nav: true, title: 'Users' }
      ]);
    }
  }
````

预渲染步骤
````
export class App {
    configureRouter(config) {
      const step = {
        run(navigationInstruction, next) {
          return next();
        }
      };
      config.addPreRenderStep(step);
      config.map([
        { route: ['', 'home'], name: 'home',  moduleId: 'home/index' },
        { route: 'users',      name: 'users', moduleId: 'users/index', nav: true, title: 'Users' }
      ]);
    }
  }
````

后渲染步骤
````
export class App {
    configureRouter(config) {
      const step = {
        run(navigationInstruction, next) {
          return next();
        }
      };
      config.addPostRenderStep(step);
      config.map([
        { route: ['', 'home'], name: 'home',  moduleId: 'home/index' },
        { route: 'users',      name: 'users', moduleId: 'users/index', nav: true, title: 'Users' }
      ]);
    }
  }
````

可以使用枚举导出中的addPipelineStep(name, step)预定义步骤名称PipelineSlotName
````
使用PipelineSlotName导出
import { PipelineSlotName } from 'aurelia-router';
  
  export class App {
    configureRouter(config) {
      const step = {
        run(navigationInstruction, next) {
          return next();
        }
      };
      config.addPipelineStep(PipelineSlotName.Authorize, step);
      config.map([
        { route: ['', 'home'], name: 'home',  moduleId: 'home/index' },
        { route: 'users',      name: 'users', moduleId: 'users/index', nav: true, title: 'Users' }
      ]);
    }
  }
````

### Router Events 路由器事件

如果要在路由器处理导航期间挂入某种状态，可以订阅一些事件：

- router:navigation:processing：路由器处理新导航时触发
- router:navigation:error：当路由器无法处理导航时触发
- router:navigation:canceled：在取消路由器导航过程（即何时next.cancel调用）时触发
- router:navigation:success：路由器成功完成导航处理后触发。
- router:navigation:complete：路由器完成导航处理时触发，无论导航处理被取消，错误或成功，它总是触发

RouterEvent用法示例
````
import { EventAggregator } from 'aurelia-event-aggregator';
  import { RouterEvent } from 'aurelia-router';
  
  export class App {
    static inject = [EventAggregator];
    
    constructor(ea) {
      ea.subscribe(RouterEvent.Complete, (event) => {
        console.log(event.instruction);
        console.log(event.result.output);
      })
    }
````

### Rendering View Ports 渲染视口

router-view自定义元素的每个实例实质上都定义了一个“查看端口”

viewPorts属性的值是一个对象，其中每个属性名称是查看端口的名称（即router-view），每个值是moduleId路由的目的地。因此，您可以在单个路由配置中指定任意数量的查看端口
- 如果您未命名a router-view，它将以“默认”名称提供
````
<template>
    <div>
      <router-view name="left"></router-view>
    </div>
    <div>
      <router-view name="right"></router-view>
    </div>
  </template>
  
export class App {
    configureRouter(config) {
      config.title = 'Aurelia';
      config.map([
        { route: 'users', name: 'users', viewPorts: { left: { moduleId: 'user/list' }, right: { moduleId: 'user/detail' } } }
      ]);
    }
  }  
````

#### Empty View Ports 空视口

通过moduleId在该视口的路由配置中将null 设置为空来清空该视口
````
export class App {
    configureRouter(config) {
      config.title = 'Aurelia';
      config.map([
        { route: 'users', name: 'users', viewPorts: { left: { moduleId: 'user/list' }, right: { moduleId: null } } }
      ]);
    }
  }
````

#### View Port Defaults 

空查看端口实际上是开箱即用的默认端口。
通过将查看端口配置传递到路由器配置，可以覆盖此默认值以加载特定值（moduleId无论何时moduleId为null）。可以为每个视口专门设置这些替代

app.js
````
export class App {
    configureRouter(config) {
      config.title = 'Aurelia';
      config.map([
        { route: 'users', name: 'users', viewPorts: { left: { moduleId: 'user/list' }, right: { moduleId: null } } }
      ]);
      config.useViewPortDefaults({
        right: { moduleId: 'pages/placeholder' }
      })
    }
  }
````

### Layouts 版面


















