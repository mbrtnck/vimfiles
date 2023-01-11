" Configuration file for Vim text editor
"
" Latest revision: 2023-01-08
"
" Copyright (c) 2002 Mikołaj Bartnicki <mikolaj@bartnicki.org>
" All rights reserved.

" work as vi improved instead of pure vi, must be the first instruction
set nocompatible

" i18n settings
language messages en_US.UTF-8   " language of messages
set encoding=UTF-8              " encoding used to display edited file
set fileencoding=UTF-8          " encoding used to save edited file

" display settings
set ruler                       " show cursor position
let loaded_matchparen = 1       " disable highlighting of matching parenthesis

" edit settings
set textwidth=0                 " don't wrap long lines by default
set tabstop=8                   " tab size (columns)
set expandtab                   " fill tabs with spaces, use <C-v><Tab> for tab
set shiftwidth=4                " indentation depth
set softtabstop=4               " <Backspace> over indentation
set backspace=indent,eol,start  " <Backspace> over everything in insert mode
set nojoinspaces                " no extra space after a dot when joining lines
set breakindent                 " keep indentation when breaking long lines
set linebreak                   " don't break lines in the middle of the word

" write settings
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
    set langmenu=en_US.UTF-8    " language of GUI window menus
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
