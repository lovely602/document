### 解决git push代码到github上一直提示输入用户名及密码的问题

1. 执行git config --global credential.helper store命令
2. git push origin your-branch
3. 输入用户名，密码

检测方式：C:\Users\你的电脑名;   这个文件夹(如下)下面是否能找到.git-credentials文件，如果文件的内容是有关你的gitlab的设置，格式为：http://{用户名}:{密码}@{git 网址}