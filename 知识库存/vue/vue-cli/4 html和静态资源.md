# HTML和静态资源    

### index文件
public/index.html 文件是一个会被 html-webpack-plugin 处理的模板。在构建过程中，资源链接会被自动注入。
另外，Vue CLI 也会自动注入 resource hint (preload/prefetch、manifest 和图标链接 (当用到 PWA 插件时) 
以及构建过程中处理的 JavaScript 和 CSS 文件的资源链接

### 插值
因为 index 文件被用作模板，所以你可以使用 lodash template 语法插入内容
````
<%= VALUE %> 用来做不转义插值；
<%- VALUE %> 用来做 HTML 转义插值；
<% expression %> 用来描述 JavaScript 流程控制
````
### preload
<link rel="preload"> 是一种 resource hint，用来指定页面加载后很快会被用到的资源，
所以在页面加载的过程中，我们希望在浏览器开始主体渲染之前尽早 preload。

默认情况下，一个 Vue CLI 应用会为所有初始化渲染需要的文件自动生成 preload 提示

这些提示会被 @vue/preload-webpack-plugin 注入，并且可以通过 chainWebpack 的 config.plugin('preload') 进行修改和删除

### prefetch
<link rel="prefetch"> 是一种 resource hint，用来告诉浏览器在页面加载完成后，利用空闲时间提前获取用户未来可能会访问的内容。

默认情况下，一个 Vue CLI 应用会为所有作为 async chunk 生成的 JavaScript 文件 (通过动态 import() 按需 code splitting 的产物) 自动生成 prefetch 提示

这些提示会被 @vue/preload-webpack-plugin 注入，并且可以通过 chainWebpack 的 config.plugin('prefetch') 进行修改和删除。
````
// vue.config.js
module.exports = {
  chainWebpack: config => {
    // 移除 prefetch 插件
    config.plugins.delete('prefetch')

    // 或者
    // 修改它的选项：
    config.plugin('prefetch').tap(options => {
      options[0].fileBlacklist = options[0].fileBlacklist || []
      options[0].fileBlacklist.push(/myasyncRoute(.)+?\.js$/)
      return options
    })
  }
}
````

### 不生成总积分
当基于已有的后端使用 Vue CLI 时，你可能不需要生成 index.html，这样生成的资源可以用于一个服务端渲染的页面。
这时可以向 vue.config.js 加入下列代码：
````
// vue.config.js
module.exports = {
  // 去掉文件名中的 hash
  filenameHashing: false,
  // 删除 HTML 相关的 webpack 插件
  chainWebpack: config => {
    config.plugins.delete('html')
    config.plugins.delete('preload')
    config.plugins.delete('prefetch')
  }
}
````

### 构建一个多页应用
不是每个应用都需要是一个单页应用。Vue CLI 支持使用 vue.config.js 中的 pages 选项构建一个多页面的应用。
构建好的应用将会在不同的入口之间高效共享通用的 chunk 以获得最佳的加载性能

### 处理静态资源
静态资源可以通过两种方式进行处理：
1. 在 JavaScript 被导入或在 template/CSS 中通过相对路径被引用。这类引用会被 webpack 处理
2. 放置在 public 目录下或通过绝对路径被引用。这类资源将会直接被拷贝，而不会经过 webpack 的处理

当你在 JavaScript、CSS 或 *.vue 文件中使用相对路径 (必须以 . 开头) 引用一个静态资源时，该资源将会被包含进入 webpack 的依赖图中。
在其编译过程中，所有诸如 <img src="...">、background: url(...) 和 CSS @import 的资源 URL 都会被解析为一个模块依赖。


### URL转换规则

+ 如果 URL 是一个绝对路径 (例如 /images/foo.png)，它将会被保留不变
+ 如果 URL 以 . 开头，它会作为一个相对模块请求被解释且基于你的文件系统中的目录结构进行解析
+ 如果 URL 以 ~ 开头，其后的任何内容都会作为一个模块请求被解析。这意味着你甚至可以引用 Node 模块中的资源
+ 如果 URL 以 @ 开头，它也会作为一个模块请求被解析。它的用处在于 Vue CLI 默认会设置一个指向 <projectRoot>/src 的别名 @


### public 文件夹
任何放置在 public 文件夹的静态资源都会被简单的复制，而不经过 webpack。你需要通过绝对路径来引用它们

public 目录提供的是一个应急手段，当你通过绝对路径引用它时，留意应用将会部署到哪里。
如果你的应用没有部署在域名的根部，那么你需要为你的 URL 配置 publicPath 前缀

````
data () {
  return {
    publicPath: process.env.BASE_URL
  }
}
<img :src="`${publicPath}my-image.png`">
<link rel="icon" href="<%= BASE_URL %>favicon.ico">
````








