" see :h vundle for more details or wiki for FAQ
syntax on		      " syntax highlight
set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'             " git support
Plug 'vim-scripts/L9'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'nvie/vim-togglemouse'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/Smart-Tabs'

Plug 'vim-scripts/tabbar'
Plug 'vim-scripts/autopreview'
Plug 'wesleyche/Trinity'

Plug 'mbriggs/mark.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/DrawIt'

Plug 'scrooloose/syntastic'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'

" file lookup
Plug 'vim-scripts/command-t'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'vim-scripts/genutils'

" async
Plug 'w0rp/ale'                       " grama check
Plug 'skywind3000/asyncrun.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'

" language specific enhance
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'jnwhiteh/vim-golang'
Plug 'pangloss/vim-javascript'

" color
Plug 'itchyny/lightline.vim'          " status bar
Plug 'Yggdroot/indentLine'
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'
Plug 'flazz/vim-colorschemes'         " vim colorschemes
Plug 'rafi/awesome-vim-colorschemes'  " vim colorschemes
Plug 'lifepillar/vim-solarized8'      " solarized8

" gutentags config
set cscopeprg='gtags-cscope'
set tags=./.tags;.tags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
let g:gutentags_project_root = ['.git','.root','.svn','.hg','.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_modules = []
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_plus_switch = 1
let g:asyncrun_bell = 1
let g:gutentags_define_advanced_commands = 1

Plug 'skywind3000/vim-preview'
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <Leader>u :PreviewScroll -1<cr> 	" 往上滚动预览窗口
noremap <leader>d :PreviewScroll +1<cr> 	" 往下滚动预览窗口

noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>

" All of your Plugs must be added before the following line
call plug#end()              " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Put your non-Plug stuff after this line
set tabstop=8
set softtabstop=8
set shiftwidth=4
"set expandtab
set hls
set encoding=utf-8
set listchars=tab:>-,trail:-

" set F3, F4 to find function and symbol
nnoremap <F3> :GscopeFind gs 
nnoremap <F4> :GscopeFind gg 
color desert
