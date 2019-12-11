## css 前缀
主流浏览器引擎前缀
+ -webkit- (谷歌, Safari, 新版Opera浏览器, 以及几乎所有iOS系统中的浏览器(包括iOS 系统中的火狐浏览器); 简单的说，所有基于WebKit 内核的浏览器)
+ -moz- (火狐浏览器)
+ -o- (旧版Opera浏览器)
+ -ms- (IE浏览器 和 Edge浏览器)
````
-webkit-transition: all 4s ease;
-moz-transition: all 4s ease;
-ms-transition: all 4s ease;
-o-transition: all 4s ease;
transition: all 4s ease; 
````

## API前缀

### 接口前缀
需要使用大写的前缀修饰接口名

- WebKit (谷歌, Safari, 新版Opera浏览器, 以及几乎所有iOS系统中的浏览器(包括iOS 系统中的火狐浏览器); 简单的说，所有基于WebKit 内核的浏览器)
- Moz (火狐浏览器)
- O (旧版Opera浏览器)
- MS (IE浏览器 和 Edge浏览器)

### 属性和方法前缀
需要使用小写的前缀修饰属性或者方法

- webkit (谷歌, Safari, 新版Opera浏览器, 以及几乎所有iOS系统中的浏览器(包括iOS 系统中的火狐浏览器); 简单的说，所有基于WebKit 内核的浏览器)
- moz (火狐浏览器)
- o (旧版Opera浏览器等
- ms (IE浏览器 和 Edge浏览器)
````
var requestAnimationFrame = window.requestAnimationFrame || 
                            window.mozRequestAnimationFrame || 
                            window.webkitRequestAnimationFrame || 
                            window.oRequestAnimationFrame || 
                            window.msRequestAnimationFrame;
````
