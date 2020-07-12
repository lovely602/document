### package.json中版本号详解
- 波浪符号（~）：他会更新到当前minor version（也就是中间的那位数字）中最新的版本
- 插入符号（^）：这个符号就显得非常的灵活了，他将会把当前库的版本更新到当前major version（也就是第一位数字）中最新的版本
````
~1.15.2 :=  >=1.15.2 <1.16.0     

^3.3.4 := >=3.3.4 <4.0.0
````

### 解决npm ERR! code ELIFECYCLE
`````
npm cache clean --force
npm install
`````

http://www.ruanyifeng.com/blog/2016/10/npm_scripts.html

https://www.jianshu.com/p/c96fdba92c44