## font 属性
简写属性在一个声明中设置所有字体属性

可设置的属性是（按顺序）： "font-style font-variant font-weight font-size/line-height font-family"
````
p.ex2
{
    font:italic bold 12px/30px Georgia, serif;
}
````

### font-family 属性
指定一个元素的字体,可以把多个字体名称作为一个"回退"系统来保存。如果浏览器不支持第一个字体，则会尝试下一个
有两种类型的字体系列名称:
- family-name - 指定的系列名称：具体字体的名称，比如："times"、"courier"、"arial"
- generic-family - 通常字体系列名称：比如："serif"、"sans-serif"、"cursive"、"fantasy"、"monospace

````
p
{
font-family:"Times New Roman",Georgia,Serif;
}
````

### font-size 属性
用于设置字体大小
````
font-size: large;
font-size: larger;
font-size: 12px;
````

### font-style 属性
指定文本的字体样式

属性值
- normal 默认值。浏览器显示一个标准的字体样式
- italic 浏览器会显示一个斜体的字体样式
- oblique 浏览器会显示一个倾斜的字体样式
- inherit 规定应该从父元素继承字体样式
````
p.normal {font-style:normal}
p.italic {font-style:italic}
p.oblique {font-style:oblique}
````

### font-variant 属性
设置小型大写字母的字体显示文本，这意味着所有的小写字母均会被转换为大写，
但是所有使用小型大写字体的字母与其余文本相比，其字体尺寸更小

属性值
- normal 默认值。浏览器会显示一个标准的字体
- small-caps 浏览器会显示小型大写字母的字体
- inherit 规定应该从父元素继承 font-variant 属性的值

### font-weight 属性
设置文本的粗细

属性值
normal 默认值。定义标准的字符
bold 定义粗体字符
bolder  定义更粗的字符
lighter 定义更细的字符
100-900  不要单位
````
p.normal {font-weight:normal;}
p.thick {font-weight:bold;}
p.thicker {font-weight:900;}
````
### @font-face 规则
- 字体的名称，font - face规则：
  - font-family: myFirstFont;
- 字体文件包含在您的服务器上的某个地方
  - src: url('Sansation_Light.ttf')
- 如果字体文件是在不同的位置，请使用完整的URL：
  - src: url('http://www.w3cschool.css/css3/Sansation_Light.ttf')  

属性值
- font-family	name	必需的。定义字体的名称
- src	URL	必需的。定义该字体下载的网址（S）
- font-stretch 可选。定义该字体应该如何被拉长。默认值是"正常"
- font-style 可选。定义该字体应该是怎样样式。默认值是"正常"
- font-weight 可选。定义字体的粗细。默认值是"正常"
- unicode-range 可选。定义该字体支持Unicode字符的范围。默认值是"ü+0-10 FFFF"
````
// 字体加载
@font-face {
  font-family: 'iconfont';
  src: url('#{$font-path}/iconfont.eot?t=1572398126208'); /* IE9 */
  src: url('#{$font-path}/iconfont.eot?t=1572398126208#iefix') format('embedded-opentype'), 
    url(),
    url('#{$font-path}/iconfont.woff?t=1572398126208') format('woff'),
    url('#{$font-path}/iconfont.ttf?t=1572398126208') format('truetype'),
    url('#{$font-path}/iconfont.svg?t=1572398126208#iconfont') format('svg'); /* iOS 4.1- */
}
````  