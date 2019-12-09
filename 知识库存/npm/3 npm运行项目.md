## npm运行项目过程

### 安装项目依赖
````
npm install
or
cnpm install
````
### 运行项目
````
npm run "script"
````
注意：script是package.json中预先定义的命令。示例如下所示：
- 执行 npm run serve 实际上就是执行 vue-cli-service serve
````
"scripts": {
    "serve": "vue-cli-service serve",
    "build": "vue-cli-service build",
    "lint": "vue-cli-service lint",
    "test:unit": "vue-cli-service test:unit",
    "test:e2e": "vue-cli-service test:e2e"
  }
````