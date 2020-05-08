let mapleader=" "

source ~/.dotvim/autoload/literatevimrc.vim

execute literatevimrc#load("~/.dotvim/plugins.md")
execute literatevimrc#load("~/.dotvim/base.md")
execute literatevimrc#load("~/.dotvim/settings.md")

" ---
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
