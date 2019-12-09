## 什么是mybatis

+ mybatis是一个持久层的框架，是apache下的顶级项目。
+ mybatis托管到github下:mybatis Github地址
+ mybatis让程序将主要精力放在sql上，通过mybatis提供的映射方式，自由灵活生成（半自动化，大部分需要程序员编写sql）满足需要sql语句。
+ mybatis可以将向 preparedStatement中的输入参数自动进行输入映射，将查询结果集灵活映射成java对象

## mybatis原理图

1. SqlMapConfig.xml, 全局配置文件，配置了数据源，事务等mybatis运行环境，配置映射文件，mapper.xml
2. SqlSessionFactory, 会话工厂，根据配置文件创建工厂，作用：创建sqlSession
3. SqlSession , 会话，是一个面向程序员的接口，作用：操作数据库，发出sql(增删改查)
4. Executor, 执行器，是一个接口(基本执行器，缓存执行器)，sqlSession内部通过执行器操作数据库
5. mapped statement(底层封装对象)。作用：对操作数据库存储封装，包括sql语句，输入参数，输出结果类型
6. 输入输出参数类型：java简单类型, hashMap, pojo自定义

## mybatis延迟加载

resultMap可以实现高级映射(使用association，collection实现一对一和一对多映射)，association,collection具备延迟加载功能。

延迟加载:先从单表查询，需要时再从关联表去查询关联，大大提高数据库性能，因为查询单表要比关联查询多张表速度要快。

注意:使用延迟加载方法，先去查询简单的sql(最好是单表，也可以关联查询)，再去按需要加载关联查询的其他信息。


## mybatis查询缓存

### 什么是查询缓存

mybatis提供查询缓存，用于减轻数据压力，提高数据库性能。

### 为什么要用缓存

如果缓存中有数据就不用从数据库中读取，大大提高系统性能

### mybatis提供一级缓存，二级缓存

一级缓存是sqlSession级别的缓存，在操作数据库时需要构造sqlSession对象，在对象中有一个数据结构(hashMap)用于存储缓存数据。
不同的sqlSession之间的缓存数据区域是互不影响的。

二级缓存是mapper级别的缓存，多个sqlSession去操作同一个mapper的sql语句，多个sqlSession可以共用二级缓存，二级缓存是跨sqlSession的。

开启二级缓存
mybatis的二级缓存是mapper范围级别的，除了在SqlMapConfig.xml设置二级缓存的总开关，还要在具体的mapper.xml文件中开启二级缓存。