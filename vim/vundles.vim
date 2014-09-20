filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/vundles/ 
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

runtime appearance.vundle
runtime project.vundle
runtime languages.vundle
runtime git.vundle
runtime ruby.vundle
runtime search.vundle
runtime textobjects.vundle
runtime vim-improvements.vundle

call vundle#end()            " required
filetype plugin indent on    " required
