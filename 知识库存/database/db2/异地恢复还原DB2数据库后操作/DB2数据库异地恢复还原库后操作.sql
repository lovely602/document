--从一个用户的数据库恢复到另一个用户的数据库。查询时会默认以当前用户的用户名作为schema，然而恢复过来的库查询时是以之前的用户名作为schema。此时 需要再设置一下schema。
--查询语句
--实际查询时的sql语句。
SELECT * FROM DB2INST.RBAC_GROUP
SELECT * FROM DB2INST.RBAC_user
--此条sql语句报错DB2 SQL Error: SQLCODE=-204, SQLSTATE=42704"
SELECT * FROM RBAC_USER

--查询当前schema   NGCMS   NGCMS
select current schema from sysibm.sysdummy1
select current schema from sysibm.dual

--执行以下语句可使在连接工具中正常操作数据表
--设置当前schema为目标数据库的schema，例如表DB2INST.RBAC_GROUP的schema即为DB2INST
SET CURRENT SCHEMA = 'DB2INST'
SET SCHEMA 'DB2INST'
SET CURRENT SQLID 'DB2INST'
