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

set nocscopeverbose
"Plug 'chazy/cscope_maps'	      " cscope_maps support

Plug 'vim-scripts/tabbar'
"Plug 'scrooloose/nerdtree'
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

" async
Plug 'w0rp/ale'                       " grama check
Plug 'skywind3000/asyncrun.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

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
set tags=./.tags;,.tags
let $GTAGSLABEL = 'pygments'
let $GTAGSCONF = '/etc/gtags.conf'
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
let g:gutentags_auto_add_gtags_cscope = 1
let g:gutentags_plus_switch = 1
let g:asyncrun_bell = 1
let g:gutentags_define_advanced_commands = 1

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
nnoremap <F3> :cs find g
nnoremap <F4> :cs find s
color desert
