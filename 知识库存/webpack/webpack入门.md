# webpack学习
https://ke.qq.com/course/483060
## webpack是什么
Webpack 是一个前端资源加载/打包工具。它将根据模块的依赖关系进行静态分析，然后将这些模块按照指定的规则生成对应的静态资源。
Webpack 可以将多种静态资源 js、css、less 转换成一个静态文件，减少了页面的请求。

## webpack的安装
在安装 Webpack 前，你本地环境需要支持 node.js
安装淘宝npm镜像可以大大提高你的下载速度
````
npm install -g cnpm --registry=https://registry.npm.taobao.org
````

使用淘宝npm镜像 cnpm 安装 webpack,webpack-cli
````
cnpm install webpack -g
cnpm install webpack-cli -g
````

## LOADER
Webpack 本身只能处理 JavaScript 模块，如果要处理其他类型的文件，就需要使用 loader 进行转换