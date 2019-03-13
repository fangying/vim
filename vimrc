syntax on		      " syntax highlight
set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start
set t_Co=256

call plug#begin('~/.vim/plugged')

" utils and navigators
Plug 'vim-scripts/L9'                 " util lib
Plug 'tpope/vim-fugitive'             " git support

Plug 'mbriggs/mark.vim'               " multiple mark highlight
Plug 'nvie/vim-togglemouse'           " mouse toggle
Plug 'tpope/vim-unimpaired'           " branch pair
Plug 'vim-scripts/Smart-Tabs'
Plug 'vim-scripts/tabbar'
Plug 'vim-scripts/autopreview'
Plug 'wesleyche/Trinity'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/DrawIt'

" file lookup
Plug 'vim-scripts/command-t'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'vim-scripts/genutils'

" YCM support
Plug 'Valloric/YouCompleteMe'

" languate support
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/a.vim'
Plug 'rust-lang/rust.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'jnwhiteh/vim-golang'
Plug 'pangloss/vim-javascript'

" color
Plug 'sunuslee/vim-plugin-random-colorscheme-picker'
Plug 'itchyny/lightline.vim'          " status bar
Plug 'Yggdroot/indentLine'
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'
Plug 'flazz/vim-colorschemes'         " vim colorschemes
Plug 'rafi/awesome-vim-colorschemes'  " vim colorschemes
Plug 'lifepillar/vim-solarized8'      " solarized8

" async
Plug 'w0rp/ale'                       " grama check
Plug 'skywind3000/asyncrun.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'

Plug 'vim-scripts/gtags.vim'
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

let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']	"use universal_ctags
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_plus_switch = 1
let g:gutentags_define_advanced_commands = 1
let g:gutentags_generate_on_empty_buffer = 1
let g:asyncrun_bell = 1

Plug 'skywind3000/vim-preview'			"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>

noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>

" leaderF
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
            
call plug#end()              " required

filetype plugin indent on    " required
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
nnoremap <F6> :GscopeFind gg 
nnoremap <F4> :ccl <CR>
