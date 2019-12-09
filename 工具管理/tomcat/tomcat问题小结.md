## tomcat常见问题

1. 同一个配置文件中，启动tomcat后有的bean纳入spring容器管理有的bean没有纳入spring容器管理？
````
清空生成的war包，当生成多个版本的war包等文件时，tomcat可能找不到当前运行的版本。
````
       
2. 增加tomcat内存设置
````
-Xms128m -Xmx1024m -XX:MaxPermSize=512m
````
       
       
      