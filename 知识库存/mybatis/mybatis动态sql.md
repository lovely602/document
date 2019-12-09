## mybatis的动态sql

## if
动态 SQL 通常要做的事情是根据条件包含 where 子句的一部分
````
<select id="findActiveBlogWithTitleLike"
     resultType="Blog">
  SELECT * FROM BLOG 
  WHERE state = ‘ACTIVE’ 
  <if test="title != null">
    AND title like #{title}
  </if>
</select>
````

## choose when otherwise
有时我们不想应用到所有的条件语句,从中择其一项。针对这种情况，MyBatis 提供了 choose 元素

````
<select id="findActiveBlogLike"
     resultType="Blog">
  SELECT * FROM BLOG WHERE state = ‘ACTIVE’
  <choose>
    <when test="title != null">
      AND title like #{title}
    </when>
    <when test="author != null and author.name != null">
      AND author_name like #{author.name}
    </when>
    <otherwise>
      AND featured = 1
    </otherwise>
  </choose>
</select>
````
## foreach
动态 SQL 的另外一个常用的操作需求是对一个集合进行遍历，通常是在构建 IN 条件语句的时候。比如：
````
<select id="selectPostIn" resultType="domain.blog.Post">
  SELECT *
  FROM POST P
  WHERE ID in
  <foreach item="item" index="index" collection="list"
      open="(" separator="," close=")">
        #{item}
  </foreach>
</select>
````

## bind
bind 元素可以从 OGNL 表达式中创建一个变量并将其绑定到上下文。比如：
````
<select id="selectBlogsLike" resultType="Blog">
  <bind name="pattern" value="'%' + _parameter.getTitle() + '%'" />
  SELECT * FROM BLOG
  WHERE title LIKE #{pattern}
</select>
````

## @Select
采用@Select注解方式来编写SQL语句，如何动态拼接sql语句
那对于@Select这种该如何做呢？其实很简单，只是需要用<script>标签包围，然后像xml语法一样书写即可
````
@Select(“select * from System where id = #{id, jdbcType=VARCHAR} and code= #{code, jdbcType=VARCHAR}”)
SystemConfig selectSysConfigById(@Param(“id”) Long id, @Param(“code”) String code);
````

````
@Select("
<script>
select COUNT(p.ID) from MM_LIST p, USER c where p.USER_ID = #{userId} and p.USER_ID = c.ID 
<if test=“status != null and status != ‘’”>and p.STATUS = #{status}</if> 
<if test=“code!= null and code!= ‘’”>and p.CODE = #{code}</if>
</script>")
Long selectUserListCount(@Param(“code”) String code, @Param(“status”)String status, @Param(“userId”)Long userId);
````

````
@Select({
      "select appId, version, lastModified from dbVersion where appId=#{appId}"})
@Results({ // 映射数据库字段名与实体类的属性名，若相同可不写
      @Result(column = "appId", property = "appId", jdbcType = JdbcType.VARCHAR),
      @Result(column = "version", property = "version", jdbcType = JdbcType.INTEGER),
      @Result(column = "lastModified", property = "lastModified", jdbcType = JdbcType.TIMESTAMP)
})
DbVersion getDbVersion(@Param("appId") String appId);
````

注意：在@Select注解中采用<script>标签包围拼接SQL语句时不能在标签里有>大于或<小于符号出现，否则会报Caused by: org.xml.sax.SAXParseException: 元素内容必须由格式正确的字符数据或标记组成。
需要对这样的标签符号进行转义即可。

## @insert
````
@Insert({
          "insert into dbVersion (appId, version, lastModified) values (#{appId}, #{version}, #{lastModified})"})
int insertDbVersion(@Param("appId") String appId, @Param("version") Integer version,
                  @Param("lastModified") Date lastModified);

@Insert({
      "insert into dbVersion (appId, version, lastModified) values (#{appId}, #{version}, #{lastModified,jdbcType=TIMESTAMP})"})
int insert(DbVersion version);
````    

## @Update
````
@Update({" drop table ${tableName} "})

void dropTable(@Param("tableName") String tableName);
````
````
@Update({
          "update dbVersion set version=#{version}, lastModified=#{lastModified} where appId=#{appId}"})
void updateDbVersion(@Param("appId") String appId, @Param("version") long version,
                   @Param("lastModified") Date lastModified);
````

注意：使用 #{tableName}占位符时，其前必须存在 = 等号，否则不会生效。若使用#{tableName}占位符不好用，可使用${tableName}连接符

## @Delete
````
@Delete({"delete from dbVersion where appId = #{appId}"})
void deleteDbVersion(@Param("appId") String appId);
````