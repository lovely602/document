# @vue/cli
官网：https://cli.vuejs.org/zh/guide/

注意：这份文档是基于@vue/cli的
# 介绍
Vue CLI 是一个基于 Vue.js 进行快速开发的完整系统，提供
- 通过 @vue/cli 搭建交互式的项目脚手架
- 通过 @vue/cli + @vue/cli-service-global 快速开始零配置原型开发
- 一个运行时依赖 (@vue/cli-service)，该依赖
  - 可升级
  - 基于 webpack 构建，并带有合理的默认配置
  - 可以通过项目内的配置文件进行配置
  - 可以通过插件进行扩展
- 一个丰富的官方插件集合，集成了前端生态中最好的工具
- 一套完全图形化的创建和管理 Vue.js 项目的用户界面


# 安装
如果你已经全局安装了旧版本的 vue-cli (1.x 或 2.x)，你需要先通过 npm uninstall vue-cli -g 或 yarn global remove vue-cli 卸载它
````
npm install -g @vue/cli
# OR
yarn global add @vue/cli
````