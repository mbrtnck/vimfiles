# vimfiles

A set of my configuration files for [Vim][00] text editor. This is a
compilation of many different configs I've made for myself over the
years since I was introduced to Vim in 2002. All gathered together,
cleaned up and updated. It's my oldest and longest evolving work I've
ever published!

## Setup

For both Windows and Linux, working installation of Git is required. Use
the right command for your operating system. For Windows I strongly
recommend Git Bash terminal that comes together with Git. For Linux any
terminal should work.

### Windows

Just clone the repository as it is, directly into your home directory:

    git clone https://github.com/mbrtnck/vimfiles ~/vimfiles

### Linux

Clone the repository content into `.vim` subfolder of your home
directory:

    git clone https://github.com/mbrtnck/vimfiles ~/.vim

That's it!

### Spellcheck

Vim has English spellcheck built-in; dictionaries for other languages
must be installed manually. Ready to use Polish spellcheck dictionary in
Vim `*.spl` file format is included in this config set. If you need some
other languages (or want to udpate the existing ones), you must create
the corresponding `*.spl` files yourself. It is simple process, here is
the example for Polish spellcheck.

Clone the Libre Office dictionaries and Vim repositories:

    git clone https://github.com/LibreOffice/dictionaries
    git clone https://github.com/vim/vim

Go to the Libre Office dictionary and copy Vim `pl_PL.diff` file
into it:

    cd dictionaries/pl_PL
    cp ../../vim/runtime/spell/pl/pl_PL.diff .

Apply the Vim diff file:

    patch < pl_PL.diff

Run Vim and make the spellcheck dictionary `*.spl` file by the command:

    mkspell! pl pl_PL

Once the `*.spl` file is ready (be patient, it takes some time), copy it
to Vim `spell` directory. Windows command is:

    mkdir -p ~/vimfiles/spell && cp pl.utf-8.spl ~/vimfiles/spell

And for Linux it is:

    mkdir -p ~/.vim/spell && cp pl.utf-8.spl ~/.vim/spell

Repeat the above procedure for each spellcheck language you need.

## Credits

In this config set I used the following third party works:

* Beautiful and easy on the eyes [Solarized][01] color scheme that is
  work of [Ethan Schoonover][02].
* Modified Shell Script indent file that is a part of the original Vim
  runtime.

## Author

Copyright &copy; 2002 [Mikołaj Bartnicki][99]<br>
All rights reserved.

[00]: https://www.vim.org
[01]: https://github.com/altercation/solarized
[02]: https://ethanschoonover.com
[99]: mailto://mikolaj@bartnicki.org
