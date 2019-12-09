## element组件
https://element.eleme.cn/#/zh-CN/component/layout

element组件的数据流动，单向流动，从视图模型流向视图
### layout布局

- <el-row>  行标签
- <el-col>  列标签

### container容器布局

- <el-container>：外层容器。当子元素中包含 <el-header> 或 <el-footer> 时，全部子元素会垂直上下排列，否则会水平左右排列
- <el-header>：顶栏容器
- <el-aside>：侧边栏容器
- <el-main>：主要区域容器
- <el-footer>：底栏容器

注意：以上组件采用了 flex 布局，使用前请确定目标浏览器是否兼容。
此外，<el-container> 的子元素是后四者也可以是其本身，后四者的父元素则只能是<el-container>。

### button按钮
- <el-button-group>：按钮群组
- <el-button>：按钮

### link文字链接
- <el-link>：文字链接

### 常用表单form控件
- <el-radio> 单选框：在一组备选项中进行单选
- <el-radio-button> 按钮样式的单选框：按钮样式的单选组合
- <el-radio-group> 单选框组：适用于在多个互斥的选项中选择的场景
- <el-checkbox> 多选框：一组备选项中进行多选
- <el-checkbox-button> 按钮样式多选框：按钮样式的多选组合
- <el-checkbox-group> 多选框组：适用于多个勾选框绑定到同一个数组的情景，通过是否勾选来表示这一组选项中选中的项
- <el-input> 输入框：通过鼠标或键盘输入字符
- <el-autocomplete> 带建议的输入框：根据输入内容提供对应的输入建议
- <el-input-number> InputNumber 计数器：仅允许输入标准的数字值，可定义范围
- <el-select> 选择器：当选项过多时，使用下拉菜单展示并选择内容
- <el-option-group> 分组:备选项进行分组展示
- <el-option> 单选：适用广泛的基础单选
- <<el-cascader> 级联选择器：当一个数据集合有清晰的层级结构时，可通过级联选择器逐级查看并选择
- <el-cascader-panel> 级联面板：级联面板是级联选择器的核心组件，与级联选择器一样，有单选、多选、动态加载等多种功能
- <el-switch> 开关：表示两种相互对立的状态间的切换，多用于触发「开/关」
- <el-slider> 滑块：通过拖动滑块在一个固定区间内进行选择
- <el-time-picker> 时间选择器：用于选择或输入日期
- <el-date-picker> 日期选择器：用于选择或输入日期
- <el-upload> 上传：通过点击或者拖拽上传文件
- <el-rate> 评分：评分组件
- <el-color-picker> 颜色选择器：用于颜色选择，支持多种格式
- <el-transfer> 穿梭框：
- <el-form> 表单：由输入框、选择器、单选框、多选框等控件组成，用以收集、校验、提交数据
- <el-form-item> 表单项：在 Form 组件中，每一个表单域由一个 Form-Item 组件构成，表单域中可以放置各种类型的表单控件，包括 Input、Select、Checkbox、Radio、Switch、DatePicker、TimePicker


### 数据类型控件
- <el-table> 表格，用于展示多条结构类似的数据，可对数据进行排序、筛选、对比或其他自定义操作
- <el-table-column> 表格列，用于展示数据
- <el-tag> 标签：用于标记和选择
- <el-progress> 进度条：用于展示操作进度，告知用户当前状态和预期
- <el-tree> 树形控件：用清晰的层级结构展示信息，可展开或折叠
- <el-pagination> 分页：当数据量过多时，使用分页分解数据
- <el-badge> 标记：出现在按钮、图标旁的数字或状态标记
- <el-avatar> 头像：用图标、图片或者字符的形式展示用户或事物信息

### 通知类型控件
- <el-alert> 警告 用于页面中展示重要的提示信息
- v-loading加载，加载数据时显示动效
- this.$message()，常用于主动操作后的反馈提示。与 Notification 的区别是后者更多用于系统级通知的被动提醒
- $msgbox(options) 自定义配置不同的内容
- $alert(message, title, options) 或 $alert(message, options) 消息提示
- $confirm(message, title, options) 或 $confirm(message, options) 确认消息
- $prompt(message, title, options) 或 $prompt(message, options) 输入,提交内容


### 导航菜单型控件
- <el-menu> 菜单
- <el-menu-item-group> 
- <el-menu-item> 菜单项
- <el-submenu> 子菜单
- <el-tabs> 标签页 分隔内容上有关联但属于不同类别的数据集合
- <el-tab-pane> 标签页的内容
- <el-breadcrumb> 面包屑：显示当前页面的路径，快速返回之前的任意页面
- <el-breadcrumb-item> 路由项：子项
- <el-page-header> 页头：如果页面的路径比较简单，推荐使用页头组件而非面包屑组件
- <el-dropdown> 下拉菜单：将动作或菜单折叠到下拉菜单中
- <el-dropdown-menu> 下拉菜单集
- <el-dropdown-item> 下拉菜单项
- <el-steps> 步骤条：引导用户按照流程完成任务的分步导航条，可根据实际应用场景设定步骤，步骤不得少于 2 步
- <el-step> 步骤项：每一步的状况

### others控件
- <el-dialog> 对话框：在保留当前页面状态的情况下，告知用户并承载相关操作
- <el-tooltip> 文字提示：常用于展示鼠标 hover 时的提示信息
- <el-popover> 弹出框：Popover 的属性与 Tooltip 很类似，它们都是基于Vue-popper开发的，用于展示或提示一些信息
- <el-card> 卡片：将信息聚合在卡片容器中展示
- <el-carousel> 走马灯：在有限空间内，循环播放同一类型的图片、文字等内容
- <el-carousel-item> 走马灯选项，
- <el-collapse> 折叠面板：通过折叠面板收纳内容区域
- <el-collapse-item> 折叠面板项
- <el-timeline> 时间线：可视化地呈现时间流信息
- <el-timeline-item> 时间线条目：各个阶段的时间线信息
- <el-divider> 分割线：区隔内容的分割线
- <el-calendar> 日历：显示日期
- <el-image> 图片：图片容器，在保留原生img的特性下，支持懒加载，自定义占位、加载失败等
- <el-backtop> 回到顶部：返回页面顶部的操作按钮
- v-infinite-scroll 无限滚动：滚动至底部时，加载更多数据
- <el-drawer> 抽屉：有些时候, Dialog 组件并不满足我们的需求, 比如你的表单很长, 亦或是你需要临时展示一些文档,
                    Drawer 拥有和 Dialog 几乎相同的 API, 在 UI 上带来不一样的体验