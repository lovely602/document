https://www.cnblogs.com/sharpest/p/7769625.html

## ORACLE日期时间函数大全

TO_DATE格式(以时间:2007-11-02   13:45:25为例)

dual是一个虚拟表，用来构成select的语法规则，oracle保证dual里面永远只有一条记录，可以用它来做很多事情

````
Year:     
yy two digits 两位年                显示值:07
yyy three digits 三位年                显示值:007
yyyy four digits 四位年                显示值:2007
   
Month:     
mm    number     两位月              显示值:11
mon    abbreviated 字符集表示          显示值:11月,若是英文版,显示nov    
month spelled out 字符集表示          显示值:11月,若是英文版,显示november
 
Day:     
dd    number         当月第几天        显示值:02
ddd    number         当年第几天        显示值:02
dy    abbreviated 当周第几天简写    显示值:星期五,若是英文版,显示fri
day    spelled out   当周第几天全写    显示值:星期五,若是英文版,显示friday       
ddspth spelled out, ordinal twelfth

Hour:
hh    two digits 12小时进制            显示值:01
hh24 two digits 24小时进制            显示值:13

Minute:
mi    two digits 60进制                显示值:45

Second:
ss    two digits 60进制                显示值:25

其它
Q     digit         季度                  显示值:4
WW    digit         当年第几周            显示值:44
W    digit          当月第几周            显示值:1
````

````
日期和字符转换函数用法（to_date,to_char）

select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') as nowTime from dual;   //日期转化为字符串  
select to_char(sysdate,'yyyy') as nowYear   from dual;   //获取时间的年  
select to_char(sysdate,'mm')    as nowMonth from dual;   //获取时间的月  
select to_char(sysdate,'dd')    as nowDay    from dual;   //获取时间的日  
select to_char(sysdate,'hh24') as nowHour   from dual;   //获取时间的时  
select to_char(sysdate,'mi')    as nowMinute from dual;   //获取时间的分  
select to_char(sysdate,'ss')    as nowSecond from dual;   //获取时间的秒

select to_date('2004-05-07 13:23:44','yyyy-mm-dd hh24:mi:ss')    from dual//

update tablename set DATEcolumn = to_date('2015-05-04 20:00:00','yyyy-mm-dd hh:mi:ss');
````