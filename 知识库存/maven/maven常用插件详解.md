## maven常用插件解析

### maven-compiler-plugin

maven是个项目管理工具，如果我们不告诉它我们的代码要使用什么样的jdk版本编译的话，
它就会用maven-compiler-plugin默认的jdk版本来进行处理，这样就容易出现版本不匹配，以至于可能导致编译不通过的问题。

```
<plugin>                                                                                                                                      
    <!-- 指定maven编译的jdk版本,如果不指定,maven3默认用jdk 1.5 maven2默认用jdk1.3 -->                                                                           
    <groupId>org.apache.maven.plugins</groupId>                                                                                               
    <artifactId>maven-compiler-plugin</artifactId>                                                                                            
    <version>3.1</version>                                                                                                                    
    <configuration>                                                                                                                           
        <!-- 一般而言，target与source是保持一致的，但是，有时候为了让程序能在其他版本的jdk中运行(对于低版本目标jdk，源代码中不能使用低版本jdk中不支持的语法)，会存在target不同于source的情况 -->                    
        <source>1.8</source> <!-- 源代码使用的JDK版本 -->                                                                                             
        <target>1.8</target> <!-- 需要生成的目标class文件的编译版本 -->                                                                                     
        <encoding>UTF-8</encoding><!-- 字符集编码 -->
        <skipTests>true</skipTests><!-- 跳过测试 -->                                                                             
        <verbose>true</verbose>
        <showWarnings>true</showWarnings>                                                                                                               
        <fork>true</fork><!-- 要使compilerVersion标签生效，还需要将fork设为true，用于明确表示编译版本配置的可用 -->                                                        
        <executable><!-- path-to-javac --></executable><!-- 使用指定的javac命令，例如：<executable>${JAVA_1_4_HOME}/bin/javac</executable> -->           
        <compilerVersion>1.3</compilerVersion><!-- 指定插件将使用的编译器的版本 -->                                                                         
        <meminitial>128m</meminitial><!-- 编译器使用的初始内存 -->                                                                                      
        <maxmem>512m</maxmem><!-- 编译器使用的最大内存 -->                                                                                              
        <compilerArgument>-verbose -bootclasspath ${java.home}\lib\rt.jar</compilerArgument><!-- 这个选项用来传递编译器自身不包含但是却支持的参数选项 -->               
    </configuration>                                                                                                                          
</plugin>
```
注意：指定maven编译的jdk版本,如果不指定,maven3默认用jdk 1.5 maven2默认用jdk1.3

### maven-source-plugin

提供项目自动将源码打包并发布的功能，在需要发布源码项目的pom.xml文件中添加如下代码即可
```
<!-- Source attach plugin -->
<plugin>
   <groupId>org.apache.maven.plugins</groupId>
   <artifactId>maven-source-plugin</artifactId>
   <executions>
      <execution>
        <id>attach-sources</id>
        <goals>
           <goal>jar</goal>
        </goals>
      </execution>
   </executions>
</plugin>
```
* 执行 mvn install，maven会自动将source install到repository 。
* 执行 mvn deploy，maven会自动将source deploy到remote-repository 。
* 执行 mvn source:jar，单独打包源码。

注意：在多项目构建中，将source-plugin置于顶层或parent的pom中并不会发挥作用，必须置于具体项目的pom中。

### maven-jar-plugin
本插件用于指定本项目生成的jar包中的MANIFEST.MF文件中的配置，如Class-Path和Main-Class，常用的配置为：
```
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-jar-plugin</artifactId>
    <configuration>
      <archive>
        <manifest>
          <addClasspath>true</addClasspath>
          <classpathPrefix>lib/</classpathPrefix>
          <mainClass>com.gjhgh.lizhixing.maven.HelloMaven</mainClass>
        </manifest>
      </archive>
    </configuration>
</plugin>
```
生成jar文件后可使用命令： java -jar xxx.jar  执行该jar文件

### maven-resources-plugin

resources插件负责处理项目资源文件并拷贝到项目输出目录。
Resources插件的目标有三个：
1. resources:resources，拷贝main resources到main output directory。
它绑定了process-resources生命周期阶段，当执行Compiler:compile插件目标前就会执行此阶段。
2. resources:testResources，拷贝test resources到test output directory。
它绑定了process-test-resources生命周期阶段，当执行surefire:test插件目标前就会执行此阶段。
3. resources:copy-resources，手动拷贝资源到输出目录

### maven-dependency-plugin

maven-dependency-plugin是处理与依赖相关的插件，它有很多可用的goal，比较常用的有以下几种：
+ dependency:copy 

将一系列在此插件内列出的artifacts ，将他们copy到一个特殊的地方，重命名或者去除其版本信息。
这个可以解决远程仓库存在但是本地仓库不存在的依赖问题，
copy操作可以用来将某个（些）maven artifact(s)拷贝到某个目录下。添加phase和goal如下
+ dependency:unpack

unpack和copy类似，只不过它会把拷来的包解开，例如
+ dependency:copy-dependencies

copy 和 unpack操作是由要拷某个包，这个包需要具体指定要拷哪个包，与当前工程的依赖没有关系。
copy-dependencies和它有点类似，但是它是用来拷当前工程的依赖包的

+ dependency:unpack-dependencies

### maven-deploy-plugin

Deploy插件是Apache Maven团队提供的官方插件，最新版本2.8.2，发布于2014-08-27。
该插件可以将构建出的构件直接部署到POM配置的远程库中

默认该插件已经配置在Maven的deploy阶段使用，而且该插件也没有配置参数，所以无需在项目的POM中配置该插件，直接执行如下命令即可。

mvn deploy

1. 对于一个Maven构件，其发布信息通常包括如下：
* 构件元数据
* 构件代码包本身
* POM
* MD5/SHA1校验文件
```
<profile>
      <id>default</id>
      <activation>
        <activeByDefault>true</activeByDefault>
      </activation>
      <build>
        <plugins>
          <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-deploy-plugin</artifactId>
            <version>2.7</version>
          </plugin>
        </plugins>
      </build>
    </profile>
```

### maven-surefire-plugin
maven中默认的情况下如果单元测试有错误，将会停止构建工程，如果想忽略错误而继续构建的话只需在pom.xml文件中添加下面的配置即可
```
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-surefire-plugin</artifactId>
    <configuration>
      <testFailureIgnore>true</testFailureIgnore>
    </configuration>
</plugin>
```

### maven-site-plugin

用户可以让Maven自动生成一个Web站点，以Web的形式发布，
如项目描述、版本控制系统地址、缺陷跟踪系统地址等，更便捷、更快速地为团队提供项目当前的状态信息。
请注意，多模块生成中模块站点之间的链接将不起作用，因为本地生成目录结构与部署的站点不匹配。

```
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-site-plugin</artifactId>
    <version>3.4</version>
    <configuration>
      <locales>zh_CN</locales>
    </configuration>
    <dependencies>
      <dependency>
        <groupId>org.apache.maven.wagon</groupId>
        <artifactId>wagon-webdav</artifactId>
        <version>1.0-beta-2</version>
      </dependency>
      <dependency>
        <groupId>org.apache.maven.doxia</groupId>
        <artifactId>doxia-module-markdown</artifactId>
        <version>1.6</version>
      </dependency>
    </dependencies>
</plugin>
```

### maven-release-plugin

Release插件是Apache Maven团队提供的官方插件，
最终版本是2015-10-17发布的2.5.3，能够为项目代码库打tag，并将项目代码库中的代码发布到SCM的新版本

1. 使用Release插件的前提条件
+  明确使用的maven-release-plugin版本，当前为2.5.2
+  在POM中配置scm的developerConnection

```
<!--  使用maven-release-plugin的前置条件-->
<scm>
    <connection></connection>
    <developerConnection></developerConnection>
    <url></url>
    <tag></tag>
</scm>
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-release-plugin</artifactId>
  <version>2.4.2</version>
  <configuration>
    <tagNameFormat>@{project.version}</tagNameFormat>
  </configuration>
  <dependencies>
    <dependency>
      <groupId>org.apache.maven.scm</groupId>
      <artifactId>maven-scm-provider-gitexe</artifactId>
      <version>1.9.4</version>
    </dependency>
  </dependencies>
</plugin>
```

### maven-scm-provider-gitexe
通常，多人协作的软件研发团队中的软件配置管理（Software Configuration Management，SCM）工作必不可少。
maven-scm-provider-gitexe插件是git相关的插件

### spring-boot-maven-plugin

Spring Boot的Maven插件（Spring Boot Maven plugin）能够以Maven的方式为应用提供Spring Boot的支持，即为Spring Boot应用提供了执行Maven操作的可能。
Spring Boot Maven plugin能够将Spring Boot应用打包为可执行的jar或war文件，然后以通常的方式运行Spring Boot应用。
Spring Boot Maven plugin的最新版本为2017.6.8发布的1.5.4.RELEASE，要求Java 8, Maven 3.2及以后

Spring Boot Maven plugin的5个Goals

1. spring-boot:repackage，默认goal。在mvn package之后，再次打包可执行的jar/war，同时保留mvn package生成的jar/war为.origin
2. spring-boot:run，运行Spring Boot应用
3. spring-boot:start，在mvn integration-test阶段，进行Spring Boot应用生命周期的管理
4. spring-boot:stop，在mvn integration-test阶段，进行Spring Boot应用生命周期的管理
5. spring-boot:build-info，生成Actuator使用的构建信息文件build-info.properties

```
<plugin>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-maven-plugin</artifactId>
    <version>1.5.4.RELEASE</version>
    <executions>
      <execution>
        <goals>
          <goal>repackage</goal>
          <goal>build-info</goal>
        </goals>
      </execution>
    </executions>
</plugin>
```
Spring Boot Maven plugin的最主要goal就是repackage，其在Maven的package生命周期阶段，
能够将mvn package生成的软件包，再次打包为可执行的软件包，并将mvn package生成的软件包重命名为*.original。

基于上述配置，对一个生成Jar软件包的项目执行如下命令
```
mvn package spring-boot:repackage
```
可以看到生成的两个jar文件，一个是*.jar，另一个是*.jar.original

### maven-assembly-plugin

普通的maven打包是打包成jar或者war包。如果想打包成zip、tar.gz等格式的时候，就要使用maven-assembly这个插件了。
```
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-assembly-plugin</artifactId>
    <version>${maven-assembly-plugin.version}</version>
    <executions>
      <execution>
        <id>assembly-bin</id>
        <phase>package</phase>
        <goals>
          <goal>single</goal>
        </goals>
        <configuration>
          <descriptors>
            <descriptors>src/assembly/bin.xml</descriptors>
          </descriptors>
          <finalName>${project.artifactId}-${project.version}</finalName>
        </configuration>
      </execution>
    </executions>
</plugin>
bin.xml文件配置信息如下所示：
<assembly xmlns="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/plugins/maven-assembly-plugin/assembly/1.1.0 http://maven.apache.org/xsd/assembly-1.1.0.xsd">
  <id>assembly-bin</id>
  <formats>
    <format>jar</format>
  </formats>
  <includeBaseDirectory>false</includeBaseDirectory>
  <fileSets>
    <fileSet>
      <directory>${project.build.outputDirectory}</directory>
      <outputDirectory>/</outputDirectory>
    </fileSet>
  </fileSets>
</assembly>
```
descriptor 标签里的文件主要是配置assembly打包相关目录、文件、依赖包等等的路径及对应输出的问题
outputDirectory 标签表示打包生成的文件输出路径
execution 标签中的id名字可以随便起，但是后面descriptor的文件里的<id>要和这里的id对应


includeBaseDirectory 这个表示最终打包文件最外层是否要加一个包装的目录
fileSet 就是要把什么文件打包到什么目录下

### buildnumber-maven-plugin

某些情况下(这种情况一般很少见),使用maven构建项目时,需要一个不重复的序列号,
比如说,打包时,包名称以当前构建时间结尾,或者每次生成的jar包中包含唯一的序列号;
这个时候,就用到了buildnumber-maven-plugin插件

```
<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>buildnumber-maven-plugin</artifactId>
    <version>1.4</version>
    <executions>
      <execution>
        <phase>validate</phase>
        <goals>
          <goal>create</goal>
        </goals>
      </execution>
    </executions>
</plugin>
```
### docker-maven-plugin

使用 docker-maven-plugin 构建镜像。
docker-maven-plugin有两种使用方式，一种是使用Dockerfile文件，一种是不使用Dockerfile文件。

1. 在 POM中指定构建信息(不使用Dockerfile文件)
在pom.xml中引入该插件

```
<!-- docker-maven-plugin插件(不带Dockerfile文件) -->
<plugin>
    <groupId>com.spotify</groupId>
    <artifactId>docker-maven-plugin</artifactId>
    <version>0.4.13</version>
    <configuration>
        <!--用于指定镜像名称-->
        <imageName>${project.name}:${project.version}</imageName>
        <!--用于指定基础镜像，相当于Dockerfile中的FROM指令-->
        <baseImage>java</baseImage>
        <!--相当于Dockerfile的ENTRYPOINT指令-->
        <entryPoint>["java", "-jar", "/${project.build.finalName}.jar"]</entryPoint>
        <!--是否跳过docker build-->
        <skipDockerBuild>true</skipDockerBuild>
        <resources>
            <resource>
                <targetPath>/</targetPath>
                <!--用于指定需要复制的根目录，${project.build.directory}表示target目录-->
                <directory>${project.build.directory}</directory>
                <!--用于指定需要复制的文件。${project.build.finalName}.jar指的是打包后的jar包文件。-->
                <include>${project.build.finalName}.jar</include>
            </resource>
        </resources>
    </configuration>
</plugin>
```

2. 使用Dockerfile文件
如果使用Dockerfile文件，必须指定dockerDirectory元素，那么 baseImage, maintainer, cmd and entryPoint这些元素也会被忽略。
dockerDirectory元素所指定的内容将被复制到${project.build.directory}/docker下，
resources元素则会复制除此之外的其它文件，例如项目jar文件。

```
<!--docker-maven-plugin插件(带Dockerfile文件)-->
<plugin>
    <groupId>com.spotify</groupId>
    <artifactId>docker-maven-plugin</artifactId>
    <version>0.4.13</version>
    <configuration>
        <imageName>${project.name}:${project.version}</imageName>
        <!--Dockerfile文件位置-->
        <dockerDirectory>docker</dockerDirectory>
        <resources>
            <resource>
                <targetPath>/</targetPath>
                <directory>${project.build.directory}</directory>
                <include>${project.build.finalName}.jar</include>
            </resource> 
        </resources>
    </configuration>
</plugin>
```

### maven-antrun-plugin
该插件提供从maven内运行Ant任务的功能，打包的时候可以复制一下文件到指定的目录。
+ ${project.basedir} 默认表示项目所在文件目录
+ ${project.build.directory} 默认表示项目所在文件目录下的target目录
+ ${project.build.finalName} 默认表示${project.artifactId}-${project.version} 项目的标识ID与项目版本的组合名称 
````
<plugin>
    <artifactId>maven-antrun-plugin</artifactId>
    <executions>
        <execution>
            <phase>package</phase> // maven打包时运行
            <goals>
                <goal>run</goal>
            </goals>
            <configuration>
                <tasks>
                    <copy todir="${project.build.directory}/install" overwrite="true">
                        <fileset dir="${project.basedir}/src/install">
                            <include name="**/*"/>
                        </fileset>
                    </copy>
                    <copy file="${project.basedir}/src/main/resources/application.yml" overwrite="true"
                          tofile="${project.build.directory}/install/build/application.yml"/>
                    <copy file="${project.build.directory}/${project.build.finalName}.jar" overwrite="true"
                          tofile="${project.build.directory}/install/build/bin/transfer.jar"/>
                </tasks>
            </configuration>
        </execution>
    </executions>
</plugin>
````