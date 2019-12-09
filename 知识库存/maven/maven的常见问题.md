## maven的常见问题

### 1. 依赖的冲突问题
在maven中存在两种冲突方式，一种是跨pom文件的冲突，另一种是同一个pom文件的冲突。

       ①：跨pom文件的依赖冲突，路径最短者优先。以第一个向上级依赖找到符合条件的依赖为准。
       ②：同一个pom文件内的依赖冲突，后声明的依赖版本会覆盖先声明的依赖版本，也就是说后面声明的依赖的版本生效。

### 2. scope各种取值详解
|scope取值|有效范围（compile, runtime, test）|依赖传递|例子|
|---|---|---|---|
|compile|all|是|spring-core|
|provided|compile, test|否|servlet-api|
|runtime|runtime, test|是|JDBC驱动|
|test|test|否|JUnit|
|system|compile, test|是||

+ compile ：为默认的依赖有效范围。如果在定义依赖关系的时候，没有明确指定依赖有效范围的话，则默认采用该依赖有效范围。
            此种依赖，在编译、运行、测试时均有效。
+ provided ：在编译、测试时有效，但是在运行时无效。
             例如：servlet-api，运行项目时，容器已经提供，就不需要Maven重复地引入一遍了。
+ runtime ：在运行、测试时有效，但是在编译代码时无效。
            例如：JDBC驱动实现，项目代码编译只需要JDK提供的JDBC接口，只有在测试或运行项目时才需要实现上述接口的具体JDBC驱动。
+ test ：只在测试时有效，例如：JUnit。
+ system ：在编译、测试时有效，但是在运行时无效。和provided的区别是，使用system范围的依赖时必须通过systemPath元素显式地指定依赖文件的路径。
由于此类依赖不是通过Maven仓库解析的，而且往往与本机系统绑定，可能造成构建的不可移植，因此应该谨慎使用。
systemPath元素可以引用环境变量。

```
假定有三个工程，C --->  B  ---> A，C依赖于B,B又依赖于A.则表示，B是C的第一级依赖，A是C的第二级依赖。
    ①：当第二级依赖的范围是compile时，依赖性传递的范围与第一级依赖的范围一致。
    ②：当第二级依赖的范围是test时，依赖不会得以传递。
    ③：当第二级依赖的范围是provided时，只传递第一级依赖范围也为provided的依赖，且传递性依赖的范围同样是provided。
    ④：当第二级依赖的范围是runtime时，传递性依赖的范围与第一级依赖的范围一致，但compile除外，此时传递的依赖范围为runtime。
```

### maven单继承问题

在maven多模块项目中，为了保持模块间依赖的统一，常规做法是在parent model中，
使用dependencyManagement预定义所有模块需要用到的dependency(依赖)。

使用import scope依赖方式

1、maven2.9以上版本

2、将dependency分类，每一类建立单独的pom文件

3、在需要使用到这些依赖的子model中，使用dependencyManagement管理依赖，并import scope依赖

注意：scope=import只能用在dependencyManagement里面,且仅用于type=pom的dependency
```
<dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-dependencies</artifactId>
                <!-- 重要：版本号要和父模块中预定义的spring boot版本号保持一致 -->
                <version>${spring.boot.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
</dependencyManagement>
```