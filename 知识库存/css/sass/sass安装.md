# sass安装

## NPM 安装
使用 npm来安装 Sass
````
npm install -g sass
````

## 使用介绍
查看版本
````
sass --version
````

使用详情
````
/* 定义变量与值 */
$bgcolor: lightblue;
$textcolor: darkblue;
$fontsize: 18px;

/* 使用变量 */
body {
  background-color: $bgcolor;
  color: $textcolor;
  font-size: $fontsize;
}
````