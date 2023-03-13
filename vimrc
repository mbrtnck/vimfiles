" Configuration file for Vim text editor
"
" Latest revision: 2023-03-02
"
" Copyright (c) 2002 Mikołaj Bartnicki <mikolaj@bartnicki.org>
" Distributed under the terms of MIT License

" work as vi improved instead of pure vi, must be the first instruction
set nocompatible

" i18n settings
set langmenu=en_US.UTF-8        " language of menus and messages
set encoding=UTF-8              " encoding used to display edited file
set fileencoding=UTF-8          " encoding used to save edited file

" display settings
set ruler                       " show cursor position
let loaded_matchparen = 1       " disable highlighting of matching parenthesis

" text settings
set textwidth=0                 " don't wrap long lines by default
set backspace=indent,eol,start  " [Backspace] over everything in Insert mode
set nojoinspaces                " no extra space after a dot when joining lines
set breakindent                 " keep indentation when breaking long lines
set linebreak                   " don't break lines in the middle of the word

" tabstop settings
set tabstop=8                   " tab size (columns)
set expandtab                   " fill tabs with spaces, tab is [Ctrl+V][Tab]
set softtabstop=4               " number of spaces for [Tab] and [Backspace]
set shiftwidth=2                " code indentation depth

" file saving settings
set confirm                     " confirm :q in case of unsaved changes
set nobackup                    " don't make backup~ files

" search settings
set incsearch                   " do incremental search
set ignorecase                  " do case insensitive search...
set smartcase                   " ...unless capital letters are used
set hlsearch                    " highlight search results

" indentation settings
filetype on                     " enable file type detection
filetype plugin on              " load plugins for specific file types
filetype indent on              " automatically indent code
set cinoptions=:0g0(0           " indentation tuning, see ':help cinoptions'

" syntax highlighting settings
syntax on                       " enable syntax highlighting
set background=light            " use light background for terminal

" non-printable characters display settings (when ':set list' command is used)
set listchars=eol:$,tab:>-,space:.,trail:.,extends:+,precedes:+,conceal:=,nbsp:_

" runtime settings
runtime macros/justify.vim      " enable '_j' keymap for text justification

" use Solarized color scheme in Linux terminal
if has("unix")
    set t_co=16                     " required by Solarized in terminal
    let g:solarized_termcolors = 16 " required by Solarized in terminal
    colorscheme solarized           " use Solarized color scheme
endif

" gVim-specific settings
if has("gui_running")
    set columns=85              " window geometry (width)
    set lines=37                " window geometry (height)
    set number                  " display line numbers
    set background=light        " use light background for GUI
    colorscheme solarized       " use Solarized color scheme

    " change background of columns beyond textwidth
    execute "set colorcolumn=+".join(range(1, 256), ",+")

    " font for displaying edited files and messages
    if has("windows")
        set guifont=Consolas:h16:cEASTEUROPE    " looks fine on Windows
    elseif has("unix")
        set guifont=Monospace\ 16               " looks fine on Linux/Gnome
    endif
endif

" automatic commands
if has("autocmd")
    " wrap lines at 80 column in plain text files
    autocmd FileType text set textwidth=80

    " wrap lines at 80 column in Markdown files
    autocmd FileType markdown set textwidth=80

    " wrap lines at 72 column in git commit messages
    autocmd BufNewFile,BufReadPre COMMIT_EDITMSG set textwidth=72

    " wrap lines at 72 column in alpine e-mail client
    autocmd BufNewFile,BufReadPre /tmp/pico.* set textwidth=72

    " use two columns tabstop for Go source code
    autocmd FileType go set tabstop=2

    " use two columns tabstop for Makefile code
    autocmd FileType make set tabstop=2

    " delete empty or whitespace-only lines at the end of file
    autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

    " reduce each group of empty or whitespace-only lines to one empty line
    autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

    " delete all trailing white spaces
    " use with caution when editing Markdown code
    autocmd BufWritePre * :%s/\s\+$//ge

    " restore a trailing space in e-mail signature separator (for alpine client)
    " must be called after removing trailing white spaces
    autocmd BufWritePre /tmp/pico.* :%s/^--$/--\ /ge

    " format Go source code on save
    autocmd BufWritePre *.go :1,$!gofmt
endif

" keyboard mapping

" center view on the next search result
nnoremap n nzz
nnoremap N Nzz

" press [F2] to toggle background between light and dark
nnoremap <F2> :let &bg = (&bg == "dark" ? "light" : "dark")<CR>
inoremap <F2> <C-o>:let &bg = (&bg == "dark" ? "light" : "dark")<CR>

" press [F3] to toggle displaying line numbers
nnoremap <F3> :set number!<CR>
inoremap <F3> <C-o>:set number!<CR>

" press [F4] to toggle showing non-printable characters
nnoremap <F4> :set list!<CR>
inoremap <F4> <C-o>:set list!<CR>

" press [F5] to turn search results highlight off
nnoremap <F5> :nohl<CR>
inoremap <F5> <C-o>:nohl<CR>

" press [Ctrl+F6] to Polish spellcheck (z= for proposed corrections)
nnoremap <C-F6> :set spell! spelllang=pl<CR>
inoremap <C-F6> <Esc>:set spell! spelllang=pl<CR>

" press [Alt+F6] to English spellcheck (z= for proposed corrections)
nnoremap <M-F6> :set spell! spelllang=en<CR>
inoremap <M-F6> <Esc>:set spell! spelllang=en<CR>

" press [F7] to automatically break long lines at 72nd column
nnoremap <F7> :set textwidth=72<CR>
inoremap <F7> <C-o>:set textwidth=72<CR>

" press [F8] to automatically break long lines at 80th column
nnoremap <F8> :set textwidth=80<CR>
inoremap <F8> <C-o>:set textwidth=80<CR>

" press [F9] to disable breaking long lines
nnoremap <F9> :set textwidth=0<CR>
inoremap <F9> <C-o>:set textwidth=0<CR>

" press [F10] to fix indentation in whole file
nnoremap <F10> m'ggVG=``zz
inoremap <F10> <Esc>m'ggVG=``zzgi

" press [Ctrl+F11] to justify current paragraph (macros/justify.vim required)
nmap <C-F11> m'vip_j``zz
imap <C-F11> <Esc>m'vip_j``zzgi

" press [Alt+F11] to justify the whole file (macros/justify.vim required)
nmap <M-F11> m'_j``zz
imap <M-F11> <Esc>m'_j``zzgi

" press [Ctrl+F12] to sort current paragraph
nnoremap <F12> m'vip:sort<CR>``zz
inoremap <F12> <Esc>m'vip:sort<CR>``zzgi

" press [Alt+F12] to sort current paragraph removing duplicate lines
nnoremap <M-F12> m'vip:sort u<CR>``zz
inoremap <M-F12> <Esc>m'vip:sort u<CR>``zzgi
