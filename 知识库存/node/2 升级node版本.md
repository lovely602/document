## 升级node版本
 查看node版本，没安装的请先安装
 ````
 node -v
 ````
 清楚node缓存
 ````
npm cache clean -f
 ````
 安装node版本管理工具'n'
 ````
npm install n -g

或者：npm install -g n --force
 ````
 使用版本管理工具安装指定node或者升级到最新node版本
 n不支持windows系统
 ````
n stable  （安装node最新版本）  
 ````
 ````
n 8.9.4 （安装node指定版本8.9.4）
 ````
 ````
node -v
 ````