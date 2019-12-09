# Maven项目打包为jar的几种方式

Maven可以使用mvn package指令对项目进行打包，如果使用java -jar xxx.jar执行运行jar文件，会出现"no main manifest attribute, in xxx.jar"（没有设置Main-Class）、ClassNotFoundException（找不到依赖包）等错误。

要想jar包能直接通过java -jar xxx.jar运行，需要满足：

1、在jar包中的META-INF/MANIFEST.MF中指定Main-Class，这样才能确定程序的入口在哪里；

2、要能加载到依赖包。

## 使用maven-jar-plugin和maven-dependency-plugin插件打包

```
<build>
	<plugins>
		<plugin>
			<groupId>org.apache.maven.plugins</groupId>
			<artifactId>maven-jar-plugin</artifactId>
			<version>2.6</version>
			<configuration>
				<archive>
					<manifest>
						<addClasspath>true</addClasspath>
						<classpathPrefix>lib/</classpathPrefix>
						<mainClass>com.xxg.Main</mainClass>
					</manifest>
				</archive>
			</configuration>
		</plugin>
		<plugin>
			<groupId>org.apache.maven.plugins</groupId>
			<artifactId>maven-dependency-plugin</artifactId>
			<version>2.10</version>
			<executions>
				<execution>
					<id>copy-dependencies</id>
					<phase>package</phase>
					<goals>
						<goal>copy-dependencies</goal>
					</goals>
					<configuration>
						<outputDirectory>${project.build.directory}/lib</outputDirectory>
					</configuration>
				</execution>
			</executions>
		</plugin>
 
	</plugins>
</build>
```
 maven-jar-plugin用于生成META-INF/MANIFEST.MF文件的部分内容，
* <mainClass>com.xxg.Main</mainClass>指定MANIFEST.MF中的Main-Class，
* <addClasspath>true</addClasspath>会在MANIFEST.MF加上Class-Path项并配置依赖包，
* <classpathPrefix>lib/</classpathPrefix>指定依赖包所在目录。
 maven-dependency-plugin插件用于将依赖包拷贝到
 <outputDirectory>${project.build.directory}/lib</outputDirectory>指定的位置，即lib目录下
 
配置完成后，通过mvn package指令打包，会在target目录下生成jar包，并将依赖包拷贝到target/lib目录下
这种方法生成jar包太多不好管理

## 使用maven-assembly-plugin插件打包
这种方式打包会将项目中的依赖包和项目代码都打为一个JAR包：
在pom.xml中配置
```
<plugin>
    <groupId>org.apache.maven.plugins</groupId>  
    <artifactId>maven-assembly-plugin</artifactId>  
    <version>2.5.5</version>  
    <configuration>  
        <archive>  
            <manifest>  
                <mainClass>com.xxg.Main</mainClass>  
            </manifest>  
        </archive>  
        <descriptorRefs>  
            <descriptorRef>jar-with-dependencies</descriptorRef>  
        </descriptorRefs>  
    </configuration>  
    <executions>
        <execution>
            <id>make-assembly</id>
            <phase>package</phase>
            <goals>
                <goal>single</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```
打包方式：mvn package
打包后会在target目录下生成一个xxx-jar-with-dependencies.jar文件，
这个文件不但包含了自己项目中的代码和资源，还包含了所有依赖包的内容。所以可以直接通过java -jar来运行

## 使用maven-shade-plugin插件打包

在pom.xml中配置
```
<build>
	<plugins>
		<plugin>
			<groupId>org.apache.maven.plugins</groupId>
			<artifactId>maven-shade-plugin</artifactId>
			<version>2.4.1</version>
			<executions>
				<execution>
					<phase>package</phase>
					<goals>
						<goal>shade</goal>
					</goals>
					<configuration>
						<transformers>
							<transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
								<mainClass>com.xxg.Main</mainClass>
							</transformer>
						</transformers>
						<!--start add  追加spring配置文件设置 -->
						<transformer implementation="org.apache.maven.plugins.shade.resource.AppendingTransformer">
                            <resource>META-INF/spring.handlers</resource>
                        </transformer>
                        <transformer implementation="org.apache.maven.plugins.shade.resource.AppendingTransformer">
                            <resource>META-INF/spring.schemas</resource>
                        </transformer>
                        <!--end add  追加spring配置文件设置 -->
					</configuration>
				</execution>
			</executions>
		</plugin>
	</plugins>
</build>
```
如果项目中用到了Spring Framework，将依赖打到一个jar包中，运行时会出现读取XML schema文件出错。
原因是Spring Framework的多个jar包中包含相同的文件spring.handlers和spring.schemas，
如果生成一个jar包会互相覆盖。为了避免互相影响，可以使用AppendingTransformer来对文件内容追加合并：
如上文额外附加内容所示：

## springBoot项目打包
springBoot项目打包最常用且最简单的方式是用springBoot的打包plugin
```
<plugin>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-maven-plugin</artifactId>
</plugin>
```
在POM中加入此插件，再点击maven [install]或[repackge]就会把当前项目里所有依赖包和当前项目的源码都打成一个JAR包，
同时还会将没有依赖包的JAR包也打出来，以.original的就是了

## groovy项目打包
如果项目中包含groovy代码，默认采用MAVEN打包时不会将groovy代码进行打包，需要加入如下配置

```
<plugin>
    <groupId>org.codehaus.gmavenplus</groupId>
    <artifactId>gmavenplus-plugin</artifactId>
    <version>1.2</version>
    <executions>
        <execution>
            <goals>
                <goal>addSources</goal>
                <goal>addStubSources</goal>
                <goal>compile</goal>
                <goal>execute</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```