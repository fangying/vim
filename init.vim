call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-json'

" fuzzy finder
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'vn-ki/coc-clap'

" symbol search & viewer
Plug 'liuchengxu/vista.vim'

" easymotion
Plug 'easymotion/vim-easymotion'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" advanced terminal
Plug 'skywind3000/vim-terminal-help'

" git support
Plug 'tpope/vim-fugitive'

" show indent line
Plug 'Yggdroot/indentLine'

" word marks
Plug 'mbriggs/mark.vim'

" trailing whitespace highlight
Plug 'bronson/vim-trailing-whitespace'

" multipule line comment
Plug 'scrooloose/nerdcommenter'

" color scheme
Plug 'liuchengxu/space-vim-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'
Plug 'flazz/vim-colorschemes'         " vim colorschemes
Plug 'rafi/awesome-vim-colorschemes'  " vim colorschemes
Plug 'lifepillar/vim-solarized8'      " solarized8

Plug 'vim-scripts/drawit'

call plug#end()


" Customize Start From Here

" basic
set nocompatible
set softtabstop=4
set shiftwidth=4
set tabstop=8
set noexpandtab
set hls
set encoding=utf-8
set listchars=tab:>-,trail:-
set cursorline
set incsearch
set hidden
set nu
set nobackup
set nowritebackup
set cmdheight=2
set laststatus=2
set background=dark
set colorcolumn=80
"set termguicolors
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
syntax on
filetype plugin indent on
" Remap leader to 'space'
let mapleader="\<space>"

" use [<Space> ]<Space> to insert blank line
function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
  ']+1
endfunction
function! s:BlankDown(count) abort
  put =repeat(nr2char(10), a:count)
  '[-1
endfunction
nnoremap <silent> [<Space> :<C-U>call <SID>BlankUp(1)<CR>
nnoremap <silent> ]<Space> :<C-U>call <SID>BlankDown(1)<CR>


" Plugins

" coc.vim
set updatetime=300
set shortmess+=c
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <S-Space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <leader>ln <Plug>(coc-rename)
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" vim-clap
nmap <silent> <leader>ls :Clap coc_symbols<CR>
nmap <silent> <leader>lf :Clap files<CR>

" vim-vista
let g:vista_default_executive = 'coc'
let g:vista_echo_cursor_strategy = 'both'

" vim-airline, use <leader> n to swith to the n-th tab
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" vim-terminal-help
let g:terminal_cwd=2
let g:terminal_height=20
let g:terminal_kill="term"
let g:terminal_close=1
tnoremap <m-q> <c-\><c-n>

" nerdcommenter
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python add one more space automatically
au FileType python let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

colorscheme space_vim_theme
hi Comment guifg=#5C6370 ctermfg=59
