## mysql数据库常见问题解读

根本方法修改my.ini

### 1.插入数据量过大时报错问题？

显示max_allowed_packet的值，值过小，插入数据报错。
````
show VARIABLES like '%max_allowed_packet%';
````
--设置max_allowed_packet的值为50M：50*1024*1024  或者  52428800
````
set global max_allowed_packet = 52428800;
````
### 2.更新mysql版本使用sqlyog工具无法连接问题？

--windows 下cmd 登录 mysql -u root -p 登录你的 mysql 数据库，然后 执行这条SQL：
````    
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
````
--password 是你自己设置的root密码，然后在重新配置SQLyog的连接，则可连接成功了，OK。

### 3.设置mysql字符集编码
https://blog.csdn.net/ygcman/article/details/83067501
-- 查看mysql字符集编码
````
show variables like "%char%";
````