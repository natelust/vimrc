set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim' 
Plugin 'fatih/vim-go'
Plugin 'dense-analysis/ale.git'
"Plugin 'vim-syntastic/syntastic.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'ajh17/Spacegray.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf.vim'
" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " required
"colorscheme evening
"if has('gui_running')
"	colorscheme breeze
"else
	set bg=light
"endif

set number
set tw=110
syntax on

set rtp+=~/.fzf

if has('gui_running')
	set guifont=hack_regular
endif

nmap <F8> :TagbarToggle<CR>

set spell spelllang=en_us

set expandtab
set tabstop=4
set shiftwidth=4
set lazyredraw
set re=1
set synmaxcol=150

" don't connect to X to get the clipboard info
set clipboard=exclude:.*

" Configure linter
"let b:ale_linters = {'cpp': ['cpplint'], 'rust': ['rls', 'cargo'], 'python': ['pyls', 'flake8']}
let g:ale_linters = {'cpp': ['cpplint'], 'rust': ['rls', 'cargo'], 'python': ['flake8', 'pyls']}
"let g:ale_linters_ignore = ['pyls']
"let g:ale_python_pyls_config = {"configurationSources": ['flake8'],"plugins": {"pycodestyle": {"enabled": v:false}}}
"let g:ale_python_pyls_config = { 'plugins': { 'pycodestyle': { 'enabled': v:false } , 'flake8': { 'enabled': v:false } , 
"                                             \ 'pyflakes': {'enabled': v:false } } }
let g:ale_python_pyls_config = {
          \   'pyls': {
      \     'plugins': {
      \       'pycodestyle': {
      \         'enabled': v:false
      \       }
      \     }
      \   },
      \ }
"   'pyls': {
"       'plugins': {
"           'pyflakes': {
"               'enabled': v:false
"           },
"           'pydocstyle': {
"               'enabled': v:false
"           },
"           'flake8': {
"               'enabled': v:false
"           },
"           'mypy': {
"               'enabled': v:true
"           }
"       }
"   }
"}
let g:ale_python_pyls_options = '-vvv'
"let b:ale_python_pyls_config = {"pyls": {"plugins": {"pyflakes":{ "enabled": v:false}, "pycodestyle": {"enabled": v:true}}}}
let b:ale_rust_rls_toolchain="stable-x86_64-unknown-linux-gnu"
"let g:ale_set_loclist = 0
let b:ale_completion_enabled = 1
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let b:ale_linters_explicit = 1

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
set hls

let g:go_version_warning = 0
set backspace=indent,eol,start

" Open vim at the last place a file was edited
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:airline_theme='deus'

" Theme and Styling 
 set t_Co=256
 set background=dark

 if (has("termguicolors"))
  set termguicolors
 endif

   let base16colorspace=256  " Access colors present in 256 colorspace
   "colorscheme spacegray
   " colorscheme spacemacs-theme
    
    "let g:spacegray_underline_search = 1
    "let g:spacegray_italicize_comments = 1
let ayucolor="mirage"
colorscheme ayu

:set list lcs=tab:\|\ 


"colorscheme evening
set cursorline
"hi CursorLine ctermbg=grey

"This unsets the "last search pattern" register by hitting return
"nnoremap <CR> :let @/ = ""
:nnoremap <silent> <CR> :nohlsearch<CR><CR>

" configuration for rust
let g:rustfmt_autosave = 1


nnoremap <silent> K :ALEHover <CR>
set encoding=UTF-8
