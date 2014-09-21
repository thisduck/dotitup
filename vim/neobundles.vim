filetype off                  " required

set rtp+=~/.vim/bundle/neobundle.vim/
set rtp+=~/.vim/neobundles/
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

runtime project.vim
runtime appearance.vim
runtime languages.vim
runtime git.vim
runtime ruby.vim
runtime search.vim
runtime textobjects.vim
runtime vim-improvements.vim

call neobundle#end()
filetype plugin indent on    " required

" NeoBundleCheck
