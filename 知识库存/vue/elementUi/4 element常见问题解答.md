## element组件的属性，有的需要加冒号“：”，有的不用？
加冒号的，说明后面的是一个变量或者表达式；没加冒号的说明后面就是对应的字符串字面量。
````

<el-radio-group v-model="handle">
  <el-radio :label="true">打开</el-radio>
   el-radio :label="false">关闭</el-radio>
</el-radio-group>
输出：true 或 false   值是Boolean类型
<el-radio-group v-model="handle">
  <el-radio label="true">打开</el-radio>
  <el-radio label="false">关闭</el-radio>
</el-radio-group>
输出：”true" 或 “false”  值是String类型
````
