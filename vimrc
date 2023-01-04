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

" gVim-specific settings
if has("gui_running")
    set langmenu=en_US.UTF-8
    set columns=85
    set lines=48
    set number
    set background=light

    " font for displaying edited files and messages
    if has("windows")
        set guifont=Consolas:h12:cEASTEUROPE    " looks fine on Windows
    elseif has("unix")
        set guifont=Monospace\ 12               " looks fine on Linux/Gnome
    endif
endif

" automatic commands
if has("autocmd")
    " wrap lines at 72 column in plain text files
    autocmd FileType text set textwidth=72

    " wrap lines at 72 column in Markdown files
    autocmd FileType markdown set textwidth=72

    " wrap lines at 72 column in git commit messages
    autocmd BufNewFile,BufReadPre COMMIT_EDITMSG set textwidth=72

    " wrap lines at 72 column in alpine e-mail client
    autocmd BufNewFile,BufReadPre /tmp/pico.* set textwidth=72

    " delete empty or whitespace-only lines at the end of file
    autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

    " reduce each group of empty or whitespace-only lines to one empty line
    autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

    " delete all trailing whitespaces
    " use with caution when editing Markdown code
    autocmd BufWritePre * :%s/\s\+$//ge

    " restore a trailing space in e-mail signature separator (for alpine client)
    " must be called after removing trailing whitespaces
    autocmd BufWritePre /tmp/pico.* :%s/^--$/--\ /ge

    " format Go source code on save
    autocmd BufWritePre *.go :1,$!gofmt
endif
