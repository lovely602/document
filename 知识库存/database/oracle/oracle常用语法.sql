# oracle 常用语法
-- 查询所有触发器
Select object_name From user_objects Where object_type='TRIGGER';
-- 查询所有存储过程
Select object_name From user_objects Where object_type='PROCEDURE';
-- 查询所有视图
Select object_name From user_objects Where object_type='VIEW';
 --所有表
Select object_name From user_objects Where object_type='TABLE';
-- 限制查询数量
select  * from tableName where rownum <= 5;
-- 查询某用户下的所有表名
SELECT * FROM USER_TABLES
-- 查询其他用户下（dba权限下）
SELECT * FROM ALL_TABLES WHERE OWNER='USER_NAME'
-- 查询所有用户的表,视图等。
select * from all_tab_comments
-- 查询本用户的表,视图等。
select * from user_tab_comments
--查询所有用户的表的列名和注释。
select * from all_col_comments
-- 查询本用户的表的列名和注释。
select * from user_col_comments
--查询所有用户的表的列名等信息。
select * from all_tab_columns
--查询本用户的表的列名等信息。
select * from user_tab_columns