call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.sh' }
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'

" utils
Plug 'vim-scripts/DrawIt'
Plug 'mbriggs/mark.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/L9'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'wesleyche/Trinity'
Plug 'vim-scripts/tabbar'
Plug 'vim-scripts/Smart-Tabs'
Plug 'nvie/vim-togglemouse'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'bronson/vim-trailing-whitespace'
Plug 'itchyny/lightline.vim'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'jnwhiteh/vim-golang'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'

" color
"Plug 'sunuslee/vim-plugin-random-colorscheme-picker'
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'
Plug 'flazz/vim-colorschemes'         " vim colorschemes
Plug 'rafi/awesome-vim-colorschemes'  " vim colorschemes
Plug 'lifepillar/vim-solarized8'      " solarized8

" gtags and gnu global support
Plug 'vim-scripts/gtags.vim'
Plug 'vim-scripts/autopreview'
Plug 'vim-scripts/genutils'

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

Plug 'skywind3000/vim-preview'
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <Leader>u :PreviewScroll -1<cr>         " 往上滚动预览窗口
noremap <leader>d :PreviewScroll +1<cr>         " 往下滚动预览窗口

" latex support
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

call plug#end()

" no clear screen when exit vim
set t_ti= t_te=
let g:gutentags_add_default_project_roots = 0
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.git', '.svn', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

if isdirectory("kernel/") && isdirectory("mm/")
    let g:gutentags_file_list_command = 'find arch/arm* arch/riscv arch/x86 block crypto drivers fs include init ipc kernel lib mm net security sound virt'
endif


set tags=./.tags;.tags
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_modules = []
set cscopeprg='gtags-cscope'
let $GTAGSLABEL = 'native'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
if executable('ctags')
        let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
endif

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_plus_switch = 1
let g:asyncrun_bell = 1
let g:gutentags_define_advanced_commands = 1
let g:gutentags_generate_on_empty_buffer = 1    " open database

"let g:gutentags_trace = 1

noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>


" set F5, F6 to find function and symbol
nnoremap <F5> :GscopeFind gs 
nnoremap <F6> :GscopeFind gg 
nnoremap <F4> :ccl <CR>
nnoremap <F7> :GutentagsUpdate <CR>

" set F3 for NERDTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" move cursor in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" LeaderF configuration
" search word under cursor, the pattern is treated as regex, and enter normal
" mode directly
noremap <C-P> :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR>
highlight Lf_hl_rgHighlight guifg=#000000 guibg=#CCCC66 ctermfg=green ctermbg=185
highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match0 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match1 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match2 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match3 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match4 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=green

" Put your non-Plug stuff after this line
set t_Co=256
set paste
set cursorline
set incsearch                 " real time search
"set background=dark
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set listchars=tab:>-,trail:-
if exists('&colorcolumn')
    set colorcolumn=80
endif
set hls
"set mouse=a    " scroll in vim
"set expandtab
set encoding=utf-8

set tabstop=4
set softtabstop=4
set shiftwidth=4
set background=light
set laststatus=2
"color flattown
"color one
color molokai
