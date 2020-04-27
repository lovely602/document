## npm使用介绍

NPM是随同NodeJS一起安装的包管理工具，常见的使用场景有以下几种：
* 允许用户从NPM服务器下载别人编写的第三方包到本地使用。
* 允许用户从NPM服务器下载并安装别人编写的命令行程序到本地使用。
* 允许用户将自己编写的包或命令行程序上传到NPM服务器供别人使用。

测试所安装npm的版本
````
npm -v
````

## 更改npm的版本
有时候npm与node存在兼容问题，需要更改npm版本
可通过@修改安装版本，不加@默认安装最新版本
之前npm版本：6.9.0  node版本：10.16.0
现在npm版本：5.4.0
````
npm install -g npm@5.4.0
````

## 使用npm命令安装模块
npm 安装node.js模块语法格式如下：
````
npm install <Module Name>
例如：使用npm命令安装常用的node.js web框架模块express
npm install express
npm i express 
上述两句代码效果相同
````

### 全局安装和本地安装
npm的包安装分为全局安装(global)和本地安装(local)两种

全局安装
- 将安装包放在 /usr/local 下或者你 node 的安装目录
- 可以直接在命令行里使用。
````
npm install express -g   # 全局安装
````
本地安装
- 将安装包放在 ./node_modules 下（运行 npm 命令时所在的目录），
如果没有 node_modules 目录，会在当前执行 npm 命令的目录下生成 node_modules 目录。
- 可以通过 require() 来引入本地安装的包。
````
npm install express          # 本地安装
````

### 查看安装信息
使用以下命令来查看所有全局安装的模块
````
npm list -g

查看某个模块的版本号
npm list grunt
````
## 卸载模块
使用以下命令卸载Node.js模块

````
npm uninstall express
````

## 更新模块
使用以下命令更新node.js模块
````
npm update express
````
## 搜索模块
````
npm search express
````
## 创建模块
创建模块，package.json是必不可少的文件。我们可以通过npm初始化命令生成package.json文件，代码如下：
````
npm init [-f|--force|-y|--yes]
````

## 使用package.json
package.json 位于模块的目录下，用于定义包的属性。 express 包的 package.json 文件内容如下所示

### package.json属性说明

+ name 包名
+ version 包的版本号
+ description 包的描述
+ homepage 包的官网url
+ author 包的作者
+ contributors 包的其他贡献者
+ dependencies 依赖包列表，如果依赖包没有安装，npm会自动将依赖包安装到node_module目录下
+ repository 包代码存放的地方的类型，可以是git或svn
+ main 指定程序的主入口文件，require('moduleName')就会加载这个文件，这个字段的默认值是index.js
+ keywords 关键字


## 版本号
npm使用语义版本号来管理代码。
语义版本号分为X,Y,Z三位，分别代码主版本号，次版本号和补丁版本号。当版本号变更时，按以下原则更新：
+ 如果只是修复了bug,需要更新Z位
+ 如果是新增了功能，但是向下兼容，需要更新Y位。
+ 如果有大变动，向下不兼容，需要更新X位。

## npm常用命令
+ npm help 可以查看所有命令
+ npm help <command> 可查看某条命令的详细帮助
+ npm build 创建目录，这个命令一般会被npm link和npn install这些命令行所调用，不会单独进行使用
+ npm install <package> 安装模块
+ npm update <package>可以把当前目录下node_modules子目录里边的对应模块更新至最新版本
+ npm update <package> -g可以把全局安装的对应命令行程序更新至最新版
+ npm cache clear 可以清空NPM本地缓存
+ npm unpublish <package>@<version>可以撤销发布自己发布过的某个版本代码
+ npm install -g <package>@<version> 可以安装指定版本的模块
+ npm config set proxy null 设置代理为空
+ npm config set https-proxy null 去掉https的代理
+ npm config set strict-ssl false 去掉证书的校验
+ npm install cnpm -g --registry=https://registry.npm.taobao.org 安装淘宝镜像
+ npm config set cache "D:\DevelopTools\nodejs\node_cache"
+ npm config set prefix "D:\DevelopTools\nodejs\node_global"

## 使用淘宝npm镜像
国内直接使用 npm 的官方镜像是非常慢的，这里推荐使用淘宝 NPM 镜像。

淘宝 NPM 镜像是一个完整 npmjs.org 镜像，你可以用此代替官方版本(只读)，同步频率目前为 10分钟 一次以保证尽量与官方服务同步。
你可以使用淘宝定制的 cnpm (gzip 压缩支持) 命令行工具代替默认的 npm:
### 使用说明
使用我们定制的 cnpm (gzip 压缩支持) 命令行工具代替默认的 npm
执行该句代码以后，即可使用cnpm下载安装其他服务，速度很快。
````
npm install -g cnpm --registry=https://registry.npm.taobao.org
````

### 安装模块
从 registry.npm.taobao.org 安装所有模块. 当安装的时候发现安装的模块还没有同步过来, 淘宝 NPM 会自动在后台进行同步,
 并且会让你从官方 NPM registry.npmjs.org 进行安装. 下次你再安装这个模块的时候, 就会直接从 淘宝 NPM 安装了
````
cnpm install [name]
````
### 同步模块
直接通过 sync 命令马上同步一个模块, 只有 cnpm 命令行才有此功能:
````
cnpm sync connect
````


## npm install -D -S -g的区别
````
npm install module_name -S    即    npm install module_name --save    写入dependencies
npm install module_name -D    即    npm install module_name --save-dev 写入devDependencies
npm install module_name --no-save 临时安装不写入依赖列表
npm install -g module_name  全局安装(命令行使用)
npm install module_name 本地安装(将安装包放在 ./node_modules 下)
````
## 重新安装依赖
````
清空node_moudle下所有文件
npm cache clear --force
npm install
````
