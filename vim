#在mac下配置配色方案
   ls /usr/share/vim/vim74/colors  //路径中的vim74因版本不同会有所不同，此命令查看配色方案
   cd        //进入家目录
   vim .vimrc     //创建配置文件
   内容如下
   set nu
   colorscheme darkblue
   syntax on

#显示关闭行号
set nu
set nonu
   
#另存文件 :w 1.html
#打开文件 :e 1.html

#光标移动
  上一个单词首 b
  下一个单词尾 e
  下一个单词首 w
  
  上下左右，hjkl
  第一行 1G或gg, 第n行 nG ，最后一行 G
  行首 0，行尾 $
  
  
  当前所在的位置百分比 ctrl+g，跳转到百分之50 50%
  
#删除
  x删除当前光标处内容
  X向前删除一个字母
  dd 删除当前行
  dG 从当前行删到最后一行
#查找替换
   /a 查找a，点n下一个，点？上一个
   :n,s/a/b/g    从第n行开始到最后一行将每一行所有的a换成b
   :n,s/a/b    从第n行开始到最后一行将每一行第一个a换成b
#编辑
  o下一行插入内容，O上一行插入内容
  a单词后插入
  i单词前插入
  复制多行 
      ：9，15 copy 16  或 ：9，15 co 16
  i单词前插入
