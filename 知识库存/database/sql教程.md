## sql简介
SQL 是用于访问和处理数据库的标准的计算机语言

- SQL，指结构化查询语言，全称是 Structured Query Language。
- SQL 让您可以访问和处理数据库。
- SQL 是一种 ANSI（American National Standards Institute 美国国家标准化组织）标准的计算机语言

## sql语法
- use fuji; 命令用于选择数据库。
- set names utf8; 命令用于设置使用的字符集。
- SELECT * FROM Websites; 读取数据表的信息

### 添加一列
alter table TABLE_NAME add column NEW_COLUMN_NAME varchar(255) not null  comment '备注';

### select 语句
````
SELECT column_name,column_name FROM table_name;

SELECT * FROM table_name;
````

### SELECT DISTINCT 语句
DISTINCT 关键词用于返回唯一不同的值
````
SELECT DISTINCT column_name,column_name FROM table_name;
````

### WHERE 子句
WHERE 子句用于提取那些满足指定条件的记录
````
SELECT column_name,column_name
FROM table_name
WHERE column_name operator value;
````

WHERE 子句中的运算符

|运算符|描述|
|----|----|
|=|等于|
|<>|不等于 在 SQL 的一些版本中，该操作符可被写成 !=|
|>|大于|
|<|小于|
|>=|大于等于|
|<=|小于等于|
|BETWEEN|在某个范围内|
|LIKE|搜索某种模式|
|IN|指定针对某个列的多个可能值|

### SQL AND & OR 运算符
AND & OR 运算符用于基于一个以上的条件对记录进行过滤
````
SELECT * FROM Websites
WHERE alexa > 15
AND (country='CN' OR country='USA');
````

### ORDER BY 关键字
ORDER BY 关键字用于对结果集按照一个列或者多个列进行排序
````
SELECT column_name,column_name
FROM table_name
ORDER BY column_name,column_name ASC|DESC;
````

- order by 排列时，不写明asc,desc的时候默认asc
- desc 或者 asc 只对它紧跟着的第一个列名有效，其他不受影响，仍然是默认的升序

### INSERT INTO 语句
INSERT INTO 语句用于向表中插入新记录。
````
第一种形式无需指定要插入数据的列名，只需提供被插入的值即可
INSERT INTO table_name
VALUES (value1,value2,value3,...);

第二种形式需要指定列名及被插入的值
INSERT INTO table_name (column1,column2,column3,...)
VALUES (value1,value2,value3,...);
````

### UPDATE 语句
UPDATE 语句用于更新表中已存在的记录
````
UPDATE table_name
SET column1=value1,column2=value2,...
WHERE some_column=some_value;
````

### DELETE 语句
DELETE 语句用于删除表中的记录

````
DELETE FROM table_name
WHERE some_column=some_value;
````

### SELECT TOP, LIMIT, ROWNUM 子句

#### SQL Server / MS Access 语法
````
SELECT TOP number|percent column_name(s)
FROM table_name;
````

#### MySQL 语法
````
SELECT column_name(s)
FROM table_name
LIMIT number;
````

#### Oracle 语法
````
SELECT column_name(s)
FROM table_name
WHERE ROWNUM <= number;
````

### LIKE 操作符
LIKE 操作符用于在 WHERE 子句中搜索列中的指定模式
````
SELECT column_name(s)
FROM table_name
WHERE column_name LIKE pattern;
````
- 百分号(%): 代表零个、一个或多个字符
- 下划线(_)：代表一个数字或字符