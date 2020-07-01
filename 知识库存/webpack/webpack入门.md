# webpack学习
https://ke.qq.com/course/483060

https://www.webpackjs.com/concepts/

https://webpack.docschina.org/configuration/optimization/
## webpack是什么
webpack 是一个现代 JavaScript 应用程序的静态模块打包器(module bundler)。

当 webpack 处理应用程序时，它会递归地构建一个依赖关系图(dependency graph)，
其中包含应用程序需要的每个模块，然后将所有这些模块打包成一个或多个 bundle

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
