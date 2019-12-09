## maven的生命周期

    maven的生命周期可以理解为项目构建步骤的集合，它定义了各个构建环节的执行顺序，有了这个顺序，它就可以自动化的执行这些命令了。
    maven的核心程序定义了抽象的生命周期，生命周期的各个阶段的具体任务是由插件来完成的。一共有三套相互独立的生命周期，各个构建执行环节的顺序不能被打乱，必须按照正确的方式执行。
    Clean LifeCycle:在进行真正的构建之前进行一些列清理工作。
    Default LifeCycle:构建的核心部分，编译，测试，打包，安装，部署等。
    Site LifeCycle:生成项目报告，站点，发布站点。
    这三个生命周期是相互独立的，可以只调用clean来清理工作目录。也可以只调用site来生成站点，或者调用 mvn clean install site运行所有的这三套生命周期

### Clean LifeCycle:在进行真正的构建之前进行一些清理工作。


    pre-clean:执行一些需要在clean之前完成的工作。
    clean：移除所有上一次构建生成的文件。
    post-clean:执行一些需要在clean之后立刻完成的工作。

### Default LifeCycle:构建的核心部分，编译，测试，打包，包装，部署等。
   执行步骤如下所示：
   
    validate
    generate-sources
    process-sources
    generate-resources
    process-resources 复制并处理资源文件，至目标目录，准备打包。
    compile 编译项目的源代码。
    process-classes
    generate-test-sources
    process-test-sources
    generate-test-resources
    process-test-resources 复制并处理资源文件，至目标测试目录。
    test-compile 编译测试源代码。
    process-test-classes
    test 使用合适的单元测试框架运行测试。这些测试代码不会被打包或部署。
    prepare-package
    package 接受编译好的代码，打包成可发布的格式，如 JAR。
    pre-integration-test
    integration-test
    post-integration-test
    verify
    install 将包安装至本地仓库，以让其它项目依赖。
    deploy 将最终的包复制到远程的仓库，以让其它开发人员与项目共享。
   注意;在maven中，只要是同一个生命周期，你执行后面的阶段，那么前面的阶段也会执行，，而且不需要额外去输入前面的阶段。
### Site LifeCycle：生成项目报告，站点，发布站点。


    pre-site:执行一些需要在生成站点文档之前完成的工作。
    site 生成项目的站点文档
    post-site 执行一些在生成站点文档之后完成的工作，并且为部署做准备。
    site-deploy 将生成的站点文档部署当特定的服务器上。