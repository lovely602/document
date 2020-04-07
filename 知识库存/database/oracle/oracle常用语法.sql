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

-- 查询数据库版本信息
select * from nls_database_parameters;

-- 创建触发器

DECLARE v NUMBER;
BEGIN
SELECT count(1) INTO v FROM user_triggers WHERE TRIGGER_NAME = 'RASCNCTR_TGR_TPRCJJBJSKU';
IF v > 0 THEN
execute IMMEDIATE 'DROP TRIGGER RASCNCTR_TGR_TPRCJJBJSKU';
END IF;
END;
go

CREATE TRIGGER RASCNCTR_TGR_TPRCJJBJSKU
AFTER INSERT OR UPDATE OR DELETE
  ON TPRCJJBJSKU
FOR each ROW
    BEGIN
    IF (inserting OR updating ) AND :NEW.POSCOMUPTYPE <> 2 THEN -- 记账生成调价商品信息
    INSERT INTO "BAAS_TRANSFER_LOG" ("ACTION", "TABLENAME", "PK", "SHOP") VALUES ('I','PMS',:NEW.JJBJBILLNO,'');
    ELSIF updating AND :NEW.POSCOMUPTYPE = 2  THEN -- 终止促销单
    INSERT INTO "BAAS_TRANSFER_LOG" ("ACTION", "TABLENAME", "PK", "SHOP") VALUES ('D','PMS',:NEW.JJBJBILLNO,'');
    ELSIF deleting THEN --deleting
    INSERT INTO "BAAS_TRANSFER_LOG" ("ACTION", "TABLENAME", "PK", "SHOP") VALUES ('D','PMS',:OLD.JJBJBILLNO,'');
    end IF;
    END;
go

