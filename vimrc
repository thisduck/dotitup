" mapping leader to space as the first thing since a number of plugins require
" this to be setup before hand.
let mapleader=" "

" The rest of this vim configuration is in markdown.
" The documentation is the configuration and vice versa.
"
" You can read about it on [Tyler Cipriani's blog](https://tylercipriani.com/blog/2017/06/14/literate-vimrc/).
"
" Not soon enough.
source ~/.dotvim/autoload/literatevimrc.vim

execute literatevimrc#load("~/.dotvim/plugins.md")
execute literatevimrc#load("~/.dotvim/settings.md")
