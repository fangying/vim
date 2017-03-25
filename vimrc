set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" 可以通过以下四种方式指定插件的来源
" a) 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。
Bundle 'L9'

" b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'

" c) 指定非Github的Git仓库的插件，需要使用git地址
" Bundle 'git://git.wincent.com/command-t.git'

" d) 指定本地Git仓库中的插件
" Bundle 'file:///Users/gmarik/path/to/plugin'

Bundle 'taglist.vim'
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Auto_Open = 0			"启动vim后自动打开taglist窗口
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1             "在左侧窗口中显示taglist窗口
noremap <F8> :TlistToggle<CR>
noremap <F6> :!ctags -R<CR>

Bundle 'vim-scripts/tabbar'             "tabbar在标题下显示文件名字
Bundle 'chazy/cscope_maps'		"cscope_maps支持
set nocscopeverbose

Bundle "Lokaltog/vim-powerline"
Bundle "scrooloose/nerdtree"
Bundle "jnwhiteh/vim-golang"

Bundle 'ctrlpvim/ctrlp.vim'

Bundle "mbriggs/mark.vim"
Bundle "vim-scripts/DrawIt"

filetype plugin indent on     " required!
