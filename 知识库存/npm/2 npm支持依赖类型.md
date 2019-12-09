### npm 目前支持以下几类依赖包管理
````
dependencies
devDependencies
peerDependencies
optionalDependencies
bundledDependencies / bundleDependencies
````

### dependencies
应用依赖，或者叫做业务依赖，这是我们最常用的依赖包管理对象！
它用于指定应用依赖的外部包，这些依赖是应用发布后正常执行时所需要的，但不包含测试时或者本地打包时所使用的包
````
npm install packageName --save
````

### devDependencies
开发环境依赖，仅次于dependencies的使用频率！它的对象定义和dependencies一样，只不过它里面的包只用于开发环境，不用于生产环境，
这些包通常是单元测试或者打包工具等，例如gulp, grunt, webpack, moca, coffee等
````
npm install packageName --save-dev
````
### peerDependencies
同等依赖，或者叫同伴依赖，用于指定当前包（也就是你写的包）兼容的宿主版本
当别人使用我们的插件时，peerDependencies就会告诉明确告诉使用方，你需要安装该插件哪个宿主版本

### optionalDependencies
可选依赖，如果有一些依赖包即使安装失败，项目仍然能够运行或者希望npm继续运行，就可以使用optionalDependencies。
另外optionalDependencies会覆盖dependencies中的同名依赖包，所以不要在两个地方都写

### bundledDependencies / bundleDependencies
打包依赖，bundledDependencies是一个包含依赖包名的数组对象，在发布时会将这个对象中的包打包到最终的发布包里