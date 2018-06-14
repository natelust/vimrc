set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim' 
Plugin 'fatih/vim-go'
"Plugin 'vim-syntastic/syntastic.git'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " required

if has('gui_running')
	colorscheme breeze
else
	set bg=light
endif

set number
set tw=110
syntax on

set rtp+=~/.fzf

if has('gui_running')
	set guifont=hack_regular
endif

nmap <F8> :TagbarToggle<CR>

"if has('gui_running')
"	autocmd VimEnter * nested :TagbarOpen
"endif

set spell spelllang=en_us

set expandtab
set tabstop=4
set shiftwidth=4

" don't connect to X to get the clipboard info
set clipboard=exclude:.*

"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"let g:syntastic_cpp_cpplint_exec = 'cpplint'
"let g:syntastic_cpp_checkers = ['cpplint']
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Configure linter
let b:ale_linters = {'cpp': ['cpplint']}

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
