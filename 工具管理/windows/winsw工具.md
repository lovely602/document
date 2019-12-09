## winsw介绍
https://blog.csdn.net/qq_28566071/article/details/80882503

spring官方推荐使用winsw来将springboot项目作为服务运行

### 安装使用

winsw的使用比较简单。从github上下载：winsw下载，要下载的文件有两个：1.winsw.exe程序；2.xml配置文件。
我下载的是最新版本的WinSW.NET4.exe和sample-minimal.xml。
下载完成后，将下载的两个文件及springboot项目的jar包放在同一个文件夹中。

需要将winsw执行程序跟xml改成同样的名字，推荐使用项目名+Service的命名方式，
比如：WinSW.NET4.exe改成myProjectService.exe，sample-minmal.xml改成myProjectService.xml。

修改myProjectService.xml文件
````
 <service> 
    <!-- 安装成windows服务后的服务名 -->
	<id>eureka-server</id> 
	<!-- 显示的服务的名称 -->
	<name>eureka-server</name>
	<!-- 对服务的描述-->
	<description>This is eureka-server.</description>
	<!-- java环境变量 -->
	<env name="JAVA_HOME" value="%JAVA_HOME%"/>
	<!-- 可执行程序 ，写java路径，若配置了java环境变量，直接写java就行-->
	<executable>java</executable>
	<!-- 参数 -->
	<arguments>-jar "C:\Java\eureka-server\eureka-server.jar"</arguments>
	<!-- 开机启动 -->
	<startmode>Automatic</startmode>
	<!-- 日志配置 -->
	<logpath>%BASE%\logs</logpath>
	<logmode>rotate</logmode>
</service>
````

配置完成后，命令行进入winsw所在的文件夹，执行“myProjectService.exe install”，其中myProjectService是你修改后的名称。
注意：命令提示符界面要用管理员权限进入，否则安装服务会失败，提示“WMI Operation failure: AccessDenied”


### 删除服务

删除服务分为两步：1停止服务；2删除服务，都是在命令行界面实现。

输入“net stop myProject”停止运行服务。

输入“myProjectService.exe uninstall”删除服务。