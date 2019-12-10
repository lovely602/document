# css 相关
Vue CLI 项目天生支持 PostCSS、CSS Modules 和包含 Sass、Less、Stylus 在内的预处理器

## 引用静态资源
所有编译后的 CSS 都会通过 css-loader 来解析其中的 url() 引用，并将这些引用作为模块请求来处理。
这意味着你可以根据本地的文件结构用相对路径来引用静态资源。
另外要注意的是如果你想要引用一个 npm 依赖中的文件，或是想要用 webpack alias，则需要在路径前加上 ~ 的前缀来避免歧义

## 预处理器
可以在创建项目的时候选择预处理器 (Sass/Less/Stylus)。如果当时没有选好，内置的 webpack 仍然会被预配置为可以完成所有的处理
````
# Sass
npm install -D sass-loader node-sass

# Less
npm install -D less-loader less

# Stylus
npm install -D stylus-loader stylus

<style lang="scss">
$color: red;
</style>
````

## css modules

如果想在 JavaScript 中作为 CSS Modules 导入 CSS 或其它预处理文件，该文件应该以 .module.(css|less|sass|scss|styl) 结尾
````
import styles from './foo.module.css'
// 所有支持的预处理器都一样工作
import sassStyles from './foo.module.scss'
````
如果你想去掉文件名中的 .module，可以设置 vue.config.js 中的 css.requireModuleExtension 为 false：
````
// vue.config.js
module.exports = {
  css: {
    requireModuleExtension: false
  }
}
````
如果你希望自定义生成的 CSS Modules 模块的类名，可以通过 vue.config.js 中的 css.loaderOptions.css 选项来实现。
所有的 css-loader 选项在这里都是支持的，例如 localIdentName 和 camelCase

````
// vue.config.js
module.exports = {
  css: {
    loaderOptions: {
      css: {
        localIdentName: '[name]-[hash]',
        camelCase: 'only'
      }
    }
  }
}
````
## 向预处理器loader传递选项
有的时候你想要向 webpack 的预处理器 loader 传递选项。
你可以使用 vue.config.js 中的 css.loaderOptions 选项。比如你可以这样向所有 Sass/Less 样式传入共享的全局变量

````
// vue.config.js
module.exports = {
  css: {
    loaderOptions: {
      // 给 sass-loader 传递选项
      sass: {
        // @/ 是 src/ 的别名
        // 所以这里假设你有 `src/variables.sass` 这个文件
        // 注意：在 sass-loader v7 中，这个选项名是 "data"
        prependData: `@import "~@/variables.sass"`
      },
      // 默认情况下 `sass` 选项会同时对 `sass` 和 `scss` 语法同时生效
      // 因为 `scss` 语法在内部也是由 sass-loader 处理的
      // 但是在配置 `data` 选项的时候
      // `scss` 语法会要求语句结尾必须有分号，`sass` 则要求必须没有分号
      // 在这种情况下，我们可以使用 `scss` 选项，对 `scss` 语法进行单独配置
      scss: {
        prependData: `@import "~@/variables.scss";`
      },
      // 给 less-loader 传递 Less.js 相关选项
      less:{
        // http://lesscss.org/usage/#less-options-strict-units `Global Variables`
        // `primary` is global variables fields name
        globalVars: {
          primary: '#fff'
        }
      }
    }
  }
}
````




























