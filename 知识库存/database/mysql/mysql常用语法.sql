-- 查看数据库编码格式
show variables like 'character_set_database';

-- 该参数开启时，你必须在update语句后携带 where 条件，否则就会报错。
set sql_safe_updates = 1;