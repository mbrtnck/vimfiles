" Configuration file for Vim text editor
"
" Latest revision: 2023-01-03
"
" Copyright (c) 2023 Mikołaj Bartnicki <mbrtnck@gmail.com>
" All rights reserved.

" work as vi improved instead of pure vi, must be the first instruction
set nocompatible

" i18n settings
language messages en_US.UTF-8
set encoding=UTF-8
set fileencoding=UTF-8
set guifont=Consolas:h12:cEASTEUROPE

" display settings
set ruler
let loaded_matchparen = 1

" edit settings
set textwidth=0
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set nojoinspaces
set breakindent
set linebreak

" write settings
set confirm
set nobackup

" search settings
set incsearch
set ignorecase
set smartcase
set hlsearch

" indentation settings
filetype on
filetype plugin on
filetype indent on
set cinoptions=:0g0(0

" syntax highlighting settings
syntax on
set background=light

" non-printable characters display settings (when ':set list' command is used)
set listchars=eol:$,tab:>-,space:.,trail:.,extends:+,precedes:+,conceal:=,nbsp:_
