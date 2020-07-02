### lerna

https://lerna.js.org/

https://www.bilibili.com/read/cv4948266?from=search

### 使用介绍

- 全局安装lerna
````
npm install lerna -g
````
- 初始化我们的项目仓库

先创建一个lerna-repo目录，然后进入此目录运行下面的命令

lerna init //先采用默认模式，生成图lerna1目录结构
![avatar](./img/lerna1.png)

- lerna有两种管理模式
  - 固定模式：固定模式，通过lerna.json的版本进行版本管理。
    当你执行lerna publish命令时， 如果距离上次发布只修改了一个模块，将会更新对应模块的版本到新的版本号，然后你可以只发布修改的库
  - 独立模式：独立模式，init的时候需要设置选项 --independent. 独立模式允许管理者对每个库单独改变版本号，每次发布的时候，你需要为每个改动的库指定版本号。
    这种情况下， lerna.json的版本号不会变化了， 默认为independent
    
### lerna.json解析
- version , 当前库的版本
- npmClient , 允许指定命令使用的client， 默认是 npm， 可以设置成 yarn
- command.publish.ignoreChanges ， 可以指定那些目录或者文件的变更不会被publish
- command.bootstrap.ignore ， 指定不受 bootstrap 命令影响的包
- command.bootstrap.npmClientArgs ， 指定默认传给 lerna bootstrap 命令的参数
- command.bootstrap.scope ， 指定那些包会受 lerna bootstrap 命令影响
- packages ， 指定包所在的目录
````
{
  "version": "1.1.3",
  "npmClient": "npm",
  "command": {
    "publish": {
      "ignoreChanges": [
        "ignored-file",
        "*.md"
      ]
    },
    "bootstrap": {
      "ignore": "component-*",
      "npmClientArgs": ["--no-package-lock"]      
    }
  },
  "packages": ["packages/*"]
}
````    

### 命令行
- lerna publish 发布新的库版本