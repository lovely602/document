## 快速原型开发
可以使用 vue serve 和 vue build 命令对单个 *.vue 文件进行快速原型开发，不过这需要先额外安装一个全局的扩展
````
npm install -g @vue/cli-service-global
````
vue serve 的缺点就是它需要安装全局依赖，这使得它在不同机器上的一致性不能得到保证。因此这只适用于快速原型开发
### vue serve
````
Usage: serve [options] [entry]

在开发环境模式下零配置为 .js 或 .vue 文件启动一个服务器


Options:

  -o, --open  打开浏览器
  -c, --copy  将本地 URL 复制到剪切板
  -h, --help  输出用法信息
````
需要的仅仅是一个 App.vue 文件
````
<template>
  <h1>Hello!</h1>
</template>
````
在这个 App.vue 文件所在的目录下运行
````
vue serve
````
vue serve 使用了和 vue create 创建的项目相同的默认设置 (webpack、Babel、PostCSS 和 ESLint)。
它会在当前目录自动推导入口文件——入口可以是 main.js、index.js、App.vue 或 app.vue 中的一个。你也可以显式地指定入口文件
````
vue serve MyComponent.vue
````

### vue build
````
Usage: build [options] [entry]

在生产环境模式下零配置构建一个 .js 或 .vue 文件


Options:

  -t, --target <target>  构建目标 (app | lib | wc | wc-async, 默认值：app)
  -n, --name <name>      库的名字或 Web Components 组件的名字 (默认值：入口文件名)
  -d, --dest <dir>       输出目录 (默认值：dist)
  -h, --help             输出用法信息
````
可以使用 vue build 将目标文件构建成一个生产环境的包并用来部署
````
vue build MyComponent.vue
````

##创建一个新项目

### vue create
运行以下命令来创建一个新项目
````
vue create hello-world
````
使用图形化界面
````
vue ui
````

## 插件与preset
Vue CLI 使用了一套基于插件的架构。如果你查阅一个新创建项目的 package.json，就会发现依赖都是以 @vue/cli-plugin- 开头的。
插件可以修改 webpack 的内部配置，也可以向 vue-cli-service 注入命令

基于插件的架构使得 Vue CLI 灵活且可扩展

### 在现有的项目中安装插件
每个 CLI 插件都会包含一个 (用来创建文件的) 生成器和一个 (用来调整 webpack 核心配置和注入命令的) 运行时插件
使用vue add 命令在一个已经创建好的项目中添加插件,解析为完整的包名 @vue/cli-plugin-eslint，然后从 npm 安装它，调用它的生成器
````
vue add @vue/eslint
or
vue add cli-plugin-eslint
````
基于一个指定的 scope 使用第三方插件。例如如果一个插件名为 @foo/vue-cli-plugin-bar，你可以这样添加它
````
vue add @foo/bar
````
### 项目本地的插件
如果你需要在项目里直接访问插件 API 而不需要创建一个完整的插件，你可以在 package.json 文件中使用 vuePlugins.service 选项：
````
{
  "vuePlugins": {
    "service": ["my-commands.js"]
  }
}
````
通过 vuePlugins.ui 选项添加像 UI 插件一样工作的文件
````
{
  "vuePlugins": {
    "ui": ["my-ui.js"]
  }
}
````
### preset 
一个 Vue CLI preset 是一个包含创建新项目所需预定义选项和插件的 JSON 对象，让用户无需在命令提示中选择它们

在 vue create 过程中保存的 preset 会被放在你的 home 目录下的一个配置文件中 (~/.vuerc)。
你可以通过直接编辑这个文件来调整、添加、删除保存好的 preset。
````
{
  "useConfigFiles": true,
  "cssPreprocessor": "sass",
  "plugins": {
    "@vue/cli-plugin-babel": {},
    "@vue/cli-plugin-eslint": {
      "config": "airbnb",
      "lintOn": ["save", "commit"]
    },
    "@vue/cli-plugin-router": {},
    "@vue/cli-plugin-vuex": {}
  }
}
````
### Preset 插件的版本管理
可以显式地指定用到的插件的版本
````
{
  "plugins": {
    "@vue/cli-plugin-eslint": {
      "version": "^3.0.0",
      // ... 该插件的其它选项
    }
  }
}
````

# 脚手架cli-service配置
### CLI服务
在package.json使用默认预设的项目中看到的内容
````
{
  "scripts": {
    "serve": "vue-cli-service serve",
    "build": "vue-cli-service build"
  }
}
````
使用npm或Yarn调用这些脚本
````
npm run serve
# OR
yarn serve
````

### vue-cli-service serve
````
Usage: vue-cli-service serve [options]
Options:
  --open    服务器启动时打开浏览器
  --copy    将URL复制到服务器启动时的剪贴板 (直接到浏览器去粘贴就OK了 http://localhost:8080/)
  --mode    指定环境模式 (默认: development)
  --host    host 地址 (default: 0.0.0.0)
  --port    端口号 (default: 8080)
  --https   使用https (default: false)
````
### vue-cli-service build
````
Usage: vue-cli-service build [options] [entry|pattern]
Options:
  --mode        指定环境模式 (default: production)
  --dest        指定输出目录 (default: dist)
  --modern      构建两个版本的 js 包：一个面向支持现代浏览器的原生 ES2015+ 包，以及一个针对其他旧浏览器的包。
  --target      允许您以项目库或Web组件的形式在项目内部构建任何组件 app | lib | wc | wc-async (default: app) ???
  --name        lib或者web组件库的名称 (default: "name" in package.json or entry filename)
  --no-clean    在构建项目之前不要删除输出目录(dist)
  --report      生成report.html以帮助分析包内容
  --report-json 生成report.json来帮助分析包内容
  --watch       监听 - 当有改变时 自动重新打包~
````
### vue-cli-service inspect
````
Usage: vue-cli-service inspect [options] [...paths]
Options:
  --mode    指定环境模式 (default: development)
````


 
 