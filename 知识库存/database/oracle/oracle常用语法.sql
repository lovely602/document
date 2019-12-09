# oracle 常用语法
-- 查询所有触发器
Select object_name From user_objects Where object_type='TRIGGER';
-- 查询所有存储过程
Select object_name From user_objects Where object_type='PROCEDURE';
-- 查询所有视图
Select object_name From user_objects Where object_type='VIEW';
 --所有表
Select object_name From user_objects Where object_type='TABLE';