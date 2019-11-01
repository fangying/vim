if exists('&colorcolumn')
    set colorcolumn=80
endif
set paste
syntax on                     " syntax highlight
set incsearch                 " real time search
set background=dark
set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')

" basic plug
Plug 'tpope/vim-fugitive'             " git support
Plug 'vim-scripts/L9'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" utils
Plug 'vim-scripts/DrawIt'
Plug 'mbriggs/mark.vim'
Plug 'vim-scripts/tabbar'
Plug 'wesleyche/Trinity'
Plug 'vim-scripts/Smart-Tabs'
Plug 'nvie/vim-togglemouse'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'

" YCM
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',  'for': ['c', 'cpp', 'rust'] }

" file lookup
Plug 'vim-scripts/command-t'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" async grama check
"Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'

" language specific enhance
"Plug 'vim-scripts/c.vim'
"Plug 'vim-scripts/a.vim'
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

" gutentags config
set cscopeprg='gtags-cscope'
set tags=./.tags;.tags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
let g:gutentags_project_root = ['.git','.root','.svn','.hg','.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_modules = []
if executable('ctags')
        let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
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
let g:gutentags_generate_on_empty_buffer = 1    " open database

"let g:gutentags_trace = 1

Plug 'skywind3000/vim-preview'
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <Leader>u :PreviewScroll -1<cr>         " 往上滚动预览窗口
noremap <leader>d :PreviewScroll +1<cr>         " 往下滚动预览窗口

noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>

" LeaderF
let g:Lf_ShortcutF = '<c-p>'
noremap <Leader>ff :LeaderfFunction<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>fl :LeaderfLine<cr>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_NormalMap = {
        \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
        \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
        \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
        \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
        \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
        \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
        \ }
" latex support
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" UltiSnips
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

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

" set F5, F6 to find function and symbol
nnoremap <F5> :GscopeFind gs
nnoremap <F9> :GscopeFind gg
nnoremap <F4> :ccl <CR>
nnoremap <F2> :let g:gutentags_trace = 1 <CR>
nnoremap <F3> :let g:gutentags_trace = 0 <CR>

color codeblocks_dark
"color Tomorrow-Night-Bright
