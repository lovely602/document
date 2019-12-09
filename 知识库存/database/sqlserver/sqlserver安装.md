## 安装教程
https://www.cnblogs.com/hewenwu/p/3661406.html

https://blog.csdn.net/generallizhong/article/details/84563667

https://www.cnblogs.com/lymkpds/p/7439668.html

安装过程中问题处理流程如下：

1. 若安装过程中遇到windows防火墙警告信息，处理方法如下：
Windows防火墙——》高级设置 ——》入站规则
    创建指定TCP端口的过滤器1433
若这样设置后未生效可以设置关闭Windows防火墙，安装完成后开启即可。

2. 若安装完成后远程登录失败
SQL server configuration manager——》SQL server网络配置
修改TCP/IP协议的属性中已启用的选项为是，并重启SQL server服务

3. 若本地登录一直失败，先确定连接属性是否正确，正确的填写方式如下

服务器类型：就是你要登录的那一项服务，比如数据库引擎、分析服务、报表服务等
服务器名称：登录到的服务器名字或者IP地址+实例名（默认实例名则可以不填写），
            例如THC\SQLEXPRESS或者192.168.11.11。
            如果是本地服务器同时又是默认实例名，则直接用"."或者(local)代替
服务器名称举例如下，以下服务器名称均可登录成功         
````
(local)        本地
127.0.0.1      本地IP
.              省略符
LIZHIXING-PC   主机名
127.17.5.233   主机IP
````            
身份验证：在安装SQL Server的时候，若选择身份验证模式了在那里选择了"Windows混合身份验证模式"，这里就可以选择"Windows身份验证"，
          否则的话在这里选择"SQL Server身份验证"，用户名填写"sa"，密码"hd123*pos"           
          
若安装的SQL server服务的默认端口不是1433，使用navicat连接时需注意：
Connect Name: 172.17.15.28
Host: 172.17.15.28,1143          
Initial Database: hbposev9
Authentication: SQL Server Authentication
User Name: sa
Password: sa