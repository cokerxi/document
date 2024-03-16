#1 vim配置方案  
   在mac下配置配色方案
   ls /usr/share/vim/vim74/colors  //路径中的vim74因版本不同会有所不同，此命令查看配色方案
   cd        //进入家目录
   vim .vimrc     //创建配置文件
   
   内容如下
   "显示行号  关闭行号 set nonu
   set nu                              
   "配色方案ls /usr/share/vim/vim74/colors  //路径中的vim74因版本不同会有所不同，此命令查看配色方案
   "colorscheme darkblue
   "语法高亮
   syntax on
   "cindent是特别针对 C语言语法自动缩进
   set cindent
   "输入一个左括号，相当于输入完整的括号再将光标向左移动一个字符
   imap [ []<LEFT>
   imap { {}<LEFT>
   imap ( ()<LEFT>

#2 vim其他配置
   " 不指定文件名打开新文件时不显示版本信息和乌干达儿童的提示
set shortmess+=I


"显示小括号、大括号等的匹配
set showmatch

"设置Tab长度为4空格
set tabstop=4
"设置自动缩进长度为4空格
set shiftwidth=4


"设置满79行自动换行，符合gnu编码规范，并自动增加注释符
set textwidth=79
set formatoptions+=mMcro

" 打开的文件若不是Makefile，则展开tab为2空格
:let filename=expand('%:t')
if filename!="Makefile" && filename!="makefile"
	"将tab扩展为空格
	set expandtab
  "设置Tab长度为2空格
  set tabstop=2
  "设置自动缩进长度为2空格
  set shiftwidth=2
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let mapleader = ","

" 打开.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" 重新加载.vimrc以使新配置立即生效
nnoremap <leader>sv :source $MYVIMRC<CR>
" 将插入模式下jk按键的连续敲击视为返回normal模式
inoremap jk <ESC>
" F2插入方法注释模板
inoremap <F2> <ESC>:call GenerateFuncComment()<CR>
nnoremap <F2> :call GenerateFuncComment()<CR>

function GenerateFuncComment()
  "all lines of the template
  let l:comlines = 17
  let l:count = 0

  normal! k

  "line number of the first line of the comment
  let l:firstline = line(".")
  
  call append(l:firstline,   "/******************************************************************************")
  call append(l:firstline+1,  "* Function Name: ")
  call append(l:firstline+2,  "*")
  call append(l:firstline+3,  "* Parameter:")
  call append(l:firstline+4,  "*   @argu1          this is the argu1")
  call append(l:firstline+5,  "*   @argu2          this is the argu2")
  call append(l:firstline+6,  "*")
  call append(l:firstline+7,  "* Description: Hrer are the description.")
  call append(l:firstline+8,  "*")
  call append(l:firstline+9,  "* Return: Here are the return.")
  call append(l:firstline+10, "*")
  call append(l:firstline+11, "* NOTE:")
  call append(l:firstline+12, "* 1. note1")
  call append(l:firstline+13, "* 2. note2")
  call append(l:firstline+14, "*")
  call append(l:firstline+15, "* Date: ".strftime("%Y-%m-%d"))
  call append(l:firstline+16, "* Author: jiliang.cai@ucas.com.cn")
  call append(l:firstline+17, "******************************************************************************/")

  "定位到Function Name：行尾
  normal! jj$
endfunction
   
#4 另存文件 :w 1.html
#5 打开文件 :e 1.html

#6 光标移动
  上一个单词首 b
  下一个单词尾 e
  下一个单词首 w
  
  上下左右，hjkl
  第一行 1G或gg, 第n行 nG ，最后一行 G
  行首 0，行尾 $
  
  
  当前所在的位置百分比 ctrl+g，跳转到百分之50 50%
  
#7 删除
  x删除当前光标处内容
  X向前删除一个字母
  dd 删除当前行
  dG 从当前行删到最后一行
#8 查找替换
   /a 查找a，点n下一个，点？上一个
   :n,s/a/b/g    从第n行开始到最后一行将每一行所有的a换成b
   :n,s/a/b    从第n行开始到最后一行将每一行第一个a换成b
#9 编辑
  o下一行插入内容，O上一行插入内容
  a单词后插入
  i单词前插入
  复制多行 
      ：9，15 copy 16  或 ：9，15 co 16
  复制当前行
    yy
  粘贴
    p 
  #Vim多行缩进技巧
  在一行上，">>",或"<<"（连按两下），可以缩进或缩出，用"n>>","n<<"（n自然数），
  多行缩进缩出,按v进入visual状态，选定多行，用“>或<”，缩进或缩出

#10 非正常关闭vi编辑器产生swp文件怎么删除
  1、用多个程序编辑同一个文件时。
  2、非常规退出时。
  第一种情况的话，为了避免同一个文件产生两个不同的版本（vim中的原话），还是建议选择只读方式为好。
  第二种情况的话，你可以用vim -r filename恢复，然后再把swp文件删除（这个时候要确保你的swp文件没有用处了，否则等于给自己挖坑了），不然每次编辑这个文件时总会有这个提示。
  删除swp文件的命令：
    rm .{your file name}.swp
