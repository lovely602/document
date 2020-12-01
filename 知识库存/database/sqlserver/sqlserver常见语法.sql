-- sqlServer常用语法结构
-- 修改表名
EXEC sp_rename '原表名', '新表名';
-- 修改字段名
EXEC sp_rename '[表名].[字段名]','新字段名' ;
-- 添加字段
alter table 表名 add 列名 字段类型;
-- 如果字段不为空，需要先添加一个默认值
alter table 表名 add 列名 字段类型 not null default 0
-- 修改字段类型
alter table 表名 alter column 字段名 字段类型;
-- 删除字段
alter table 表名 drop column 字段名;
--  查看表结构
sp_help 表名
-- 查看表字段定义
sp_columns 表名
-- 设置自增字段 identity 的起始值，n+1表示的是表中identity字段的初始值（n的值可以为0）
dbcc checkident(表名,reseed,n);
-- 查询所有触发器
select name from sysobjects where xtype='TR'
-- 所有存储过程
select name from sysobjects where xtype='P'
-- 所有视图
select name from sysobjects where xtype='V'
-- 所有表
select name from sysobjects where xtype='U'
-- 修改默认schema

-- 查看数据库版本
select @@version
-- object_id 函数
--语法：object_id('objectname')或object('objectname','type')
--作用：该函数会返回指定对象的ID值，可以在sysobjects表中进行验证


