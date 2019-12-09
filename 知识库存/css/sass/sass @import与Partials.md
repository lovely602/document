### @import
@import 指令可以让我们导入其他文件等内容

语法：@import filename;

注意：包含文件时不需要指定文件后缀，Sass 会自动添加后缀 .scss。
````
@import "variables";
````

### Partials
如果你不希望将一个 Sass 的代码文件编译到一个 CSS 文件，你可以在文件名的开头添加一个下划线。
这将告诉 Sass 不要将其编译到 CSS 文件。

语法：_filename;
````
@import "colors";
````
注意：
1. 在导入语句中我们不需要添加下划线
2. 请不要将带下划线与不带下划线的同名文件放置在同一个目录下，比如，_colors.scss 和 colors.scss 不能同时存在于同一个目录下，否则带下划线的文件将会被忽略。

