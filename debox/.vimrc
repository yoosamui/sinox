set nocompatible
set autochdir
set ignorecase
set scrolloff=5
set breakindent
set showbreak=+++
set number
set background=dark
set cursorline
set laststatus=2
set hidden
set splitbelow
set splitright
if has("gui_win32")
    set guifont=Noto\ Mono:h16
endif
if has("gui_mac") || has("gui_macvim")
    set guifont=Noto\ Mono:h16
    set transparency=5
    set blurradius=5
endif
if has("gui_gtk")
    set guifont=Noto\ Mono\ 15
endif
set guioptions-=L
set guioptions-=T
set guioptions-=m
set guioptions+=k
set guioptions+=!
set ruler
set confirm
set noerrorbells
set novisualbell
set belloff=all

set helplang=en
set backspace=indent,eol,start
set showmatch 
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set autoread
set wildmenu
set encoding=utf-8
set termencoding=utf-8
set incsearch

if has("gui_running")
    set lines=999 columns=999
else
    if exists("+lines")
        set lines=50
    endif
    if exists("+columns")
        set columns=100
    endif
endif

colorscheme desert
syntax enable

if has("gui_win32")
    source c:\vim\_vimrc-golang
else
    source ~/.vimrc-golang
endif
