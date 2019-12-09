## tomcat 解压后目录介绍

- bin：二进制执行文件。里面最常用的文件是startup.bat，如果是 Linux 或 Mac 系统启动文件为 startup.sh
- conf:配置目录。里面最核心的文件是server.xml。可以在里面改端口号等。默认端口号是8080，也就是说，此端口号不能被其他应用程序占用
- lib：库文件。tomcat运行时需要的jar包所在的目录
- logs：日志
- temp：临时产生的文件，即缓存
- webapps：web的应用程序。web应用放置到此目录下浏览器可以直接访问
- work：编译以后的class文件