filetype off                  " required

set rtp+=~/.dotvim/plugs/
call plug#begin('~/.dotvim/plugged')

runtime project.vim
runtime appearance.vim
runtime git.vim
runtime search.vim
runtime textobjects.vim
runtime vim-improvements.vim
runtime languages.vim
runtime ruby.vim

call plug#end()

filetype plugin indent on    " required
