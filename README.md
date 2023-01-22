# vimfiles

A set of my configuration files for [Vim][00] text editor. This is a
compilation of many different configs I've made for myself over the
years since I was introduced to Vim in 2002. All gathered together,
cleaned up and updated. It's my oldest and longest evolving work I've
ever published.

## Installation

For both Windows and Linux, working installation of Git is required. Use
the right command for your operating system.

### Windows

Just clone the repository as it is, directly into your home directory:

    git clone https://github.com/mbrtnck/vimfiles ~

### Linux

Clone the repository content into `.vim` subfolder of your home
directory:

    git clone https://github.com/mbrtnck/vimfiles ~/.vim

That's it!

### Spellcheck

Ready to use spellcheck dictionaries in Vim `*.spl` format are included.
However, since auto downloading them by vim fails, you need to re-create
them when needed, i.e. to add the missing ones you need or to update
them. Here is the example of the process for Polish spellcheck.

Clone the Libre Office dictionaries and Vim repositories:

    git clone https://github.com/LibreOffice/dictionaries
    git clone https://github.com/vim/vim

Go to the Libre Office dictionary and copy the Vim `*.diff` file into
it:

    cd dictionaries/pl_PL
    cp ../vim/runtime/spell/pl_PL.diff .

Apply the Vim diff file. This will create `*.spl` dictionary file for
Vim:

    patch < pl_PL.diff

Once the `*.spl` file is ready, copy it to vim spell directory. Windows
command is:

    mkdir -p ~/vimfiles/spell && cp .spl ~/vimfiles/spell

And for Linux it is:

    mkdir -p ~/.vim/spell && cp .spl ~/.vim/spell

Repeat the above procedure for each spellcheck language you need.

## Credits

I use absolutely beautiful [Solarized][01] color scheme that is work of
[Ethan Schoonover][02].

## Author

Copyright &copy; 2002 [Mikołaj Bartnicki][99]

[00]: https://www.vim.org
[01]: https://github.com/altercation/solarized
[02]: https://ethanschoonover.com
[99]: mailto://mikolaj@bartnicki.org
