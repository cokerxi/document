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
  第一行 1G,第n行，nG
  最后一行 G
  
#删除
  x删除当前光标处内容
  X向前删除一个字母
  dd 删除当前行
  dG 从当前行删到最后一行
  
#编辑
  o下一行插入内容，O上一行插入内容
  a单词后插入
  i单词前插入
