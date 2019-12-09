## GETDATE()的使用方式

在sqlServer中生成日期时间的函数是GETDATE();
````
GETDATE(); 获取当前日期方法
SELECT GETDATE() CurrentDateTime;
````

如何在sql语句中实现特殊的时间格式，各种日期格式对应转化方式如下
````
Select CONVERT(varchar(100), GETDATE(), 0): 10  8 2019  9:57AM
Select CONVERT(varchar(100), GETDATE(), 1): 10/08/19
Select CONVERT(varchar(100), GETDATE(), 2): 19.10.08
Select CONVERT(varchar(100), GETDATE(), 3): 08/10/19
Select CONVERT(varchar(100), GETDATE(), 4): 08.10.19
Select CONVERT(varchar(100), GETDATE(), 5): 08-10-19
Select CONVERT(varchar(100), GETDATE(), 6): 08 10 19
Select CONVERT(varchar(100), GETDATE(), 7): 10 08, 19
Select CONVERT(varchar(100), GETDATE(), 8): 10:04:11
Select CONVERT(varchar(100), GETDATE(), 9): 10  8 2019 10:04:45:067AM
Select CONVERT(varchar(100), GETDATE(), 10): 10-08-19
Select CONVERT(varchar(100), GETDATE(), 11): 19/10/08
Select CONVERT(varchar(100), GETDATE(), 12): 191008
Select CONVERT(varchar(100), GETDATE(), 13): 08 10 2019 10:07:12:013
Select CONVERT(varchar(100), GETDATE(), 14): 10:07:36:963
Select CONVERT(varchar(100), GETDATE(), 20): 2019-10-08 10:08:54
Select CONVERT(varchar(100), GETDATE(), 21): 2019-10-08 10:09:20.267
Select CONVERT(varchar(100), GETDATE(), 22): 10/08/19 10:09:51 AM
Select CONVERT(varchar(100), GETDATE(), 23): 2019-10-08
Select CONVERT(varchar(100), GETDATE(), 24): 10:10:57
Select CONVERT(varchar(100), GETDATE(), 25): 2019-10-08 10:13:23.750
Select CONVERT(varchar(100), GETDATE(), 100): 10  8 2019 10:14AM
Select CONVERT(varchar(100), GETDATE(), 101): 10/08/2019
Select CONVERT(varchar(100), GETDATE(), 102): 2019.10.08
Select CONVERT(varchar(100), GETDATE(), 103): 08/10/2019
Select CONVERT(varchar(100), GETDATE(), 104): 08.10.2019
Select CONVERT(varchar(100), GETDATE(), 105): 08-10-2019
Select CONVERT(varchar(100), GETDATE(), 106): 08 10 2019
Select CONVERT(varchar(100), GETDATE(), 107): 10 08, 2019
Select CONVERT(varchar(100), GETDATE(), 108): 10:18:30
Select CONVERT(varchar(100), GETDATE(), 109): 10  8 2019 10:19:01:567AM
Select CONVERT(varchar(100), GETDATE(), 110): 10-08-2019
Select CONVERT(varchar(100), GETDATE(), 111): 2019/10/08
Select CONVERT(varchar(100), GETDATE(), 112): 20191008
Select CONVERT(varchar(100), GETDATE(), 113): 08 10 2019 10:21:07:043
Select CONVERT(varchar(100), GETDATE(), 114): 10:21:32:920
Select CONVERT(varchar(100), GETDATE(), 120): 2019-10-08 10:22:13
Select CONVERT(varchar(100), GETDATE(), 121): 2019-10-08 10:22:51.230
Select CONVERT(varchar(100), GETDATE(), 126): 2019-10-08T10:23:52.110
Select CONVERT(varchar(100), GETDATE(), 130):  9 ??? 1441 10:24:21:577AM
Select CONVERT(varchar(100), GETDATE(), 131):   9/02/1441 10:24:57:097AM
````