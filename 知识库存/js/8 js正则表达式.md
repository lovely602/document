## JavaScript RegExp 对象
RegExp：是正则表达式（regular expression）的简写

### 什么是 RegExp
正则表达式描述了字符的模式对象

语法：
var patt=new RegExp(pattern,modifiers);

var patt=/pattern/modifiers;
````
new RegExp("\w")
或者更简单方式：
/\w/
````
### 修饰符
修饰符用于执行区分大小写和全局匹配:
- i	执行对大小写不敏感的匹配
- g	执行全局匹配（查找所有匹配而非在找到第一个匹配后停止）
- m	执行多行匹配

### 方括号
方括号用于查找某个范围内的字符：
- [abc]	查找方括号之间的任何字符
- [^abc]	查找任何不在方括号之间的字符
- [0-9]	查找任何从 0 至 9 的数字
- [a-z]	查找任何从小写 a 到小写 z 的字符
- [A-Z]	查找任何从大写 A 到大写 Z 的字符
- [A-z]	查找任何从大写 A 到小写 z 的字符
- (red|blue|green)	查找任何指定的选项

### 元字符
元字符（Metacharacter）是拥有特殊含义的字符
- .	查找单个字符，除了换行和行结束符
- \w	查找单词字符
- \W	查找非单词字符
- \d	查找数字
- \D	查找非数字字符
- \s	查找空白字符
- \S	查找非空白字符
- \b	匹配单词边界
- \B	匹配非单词边界
- \n	查找换行符
- \f	查找换页符
- \r	查找回车符
- \t	查找制表符
- \v	查找垂直制表符

### 量词
- n+ 匹配任何包含至少一个 n 的字符串
- n* 匹配任何包含零个或多个 n 的字符串
- n? 匹配任何包含零个或一个 n 的字符串
- n{X} 匹配包含 X 个 n 的序列的字符串
- n{X,} X 是一个正整数。前面的模式 n 连续出现至少 X 次时匹配
- n{X,Y} X 和 Y 为正整数。前面的模式 n 连续出现至少 X 次，至多 Y 次时匹配
- n$ 匹配任何结尾为 n 的字符串
- ^n 匹配任何开头为 n 的字符串 
- ?=n 匹配任何其后紧接指定字符串 n 的字符串
- ?!n 匹配任何其后没有紧接指定字符串 n 的字符串

## RegExp 对象方法
### test()
test()方法搜索字符串指定的值，根据结果并返回真或假
````
var patt1=new RegExp("e");
document.write(patt1.test("The best things in life are free"));
````
### exec()
exec() 方法检索字符串中的指定值。返回值是被找到的值。如果没有发现匹配，则返回 null
````
var patt1=new RegExp("e");
document.write(patt1.exec("The best things in life are free"));
````

## 支持正则表达式的 String 对象的方法
### search	
检索与正则表达式相匹配的值
### match	
找到一个或多个正则表达式的匹配
````
function myFunction(){
	var str = "The rain in SPAIN stays mainly in the plain"; 
	var n=str.match(/ain/gi);
	document.getElementById("demo").innerHTML=n;
}
````