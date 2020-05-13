Start vim-plug and setup dotitup plugins.

```vim
call plug#begin('~/.dotvim/plugged')

execute literatevimrc#load("~/.dotvim/plugins/appearance.md")
execute literatevimrc#load("~/.dotvim/plugins/motion.md")
execute literatevimrc#load("~/.dotvim/plugins/search.md")
execute literatevimrc#load("~/.dotvim/plugins/git.md")
execute literatevimrc#load("~/.dotvim/plugins/lsp.md")
execute literatevimrc#load("~/.dotvim/plugins/editor.md")
execute literatevimrc#load("~/.dotvim/plugins/ruby.md")
execute literatevimrc#load("~/.dotvim/plugins/textobjects.md")

" execute literatevimrc#load("~/.dotvim/plugins/project.md")
" execute literatevimrc#load("~/.dotvim/plugins/vim-improvements.md")
```

Allow potential users to add thier own plugins using an after vimrc.  
And close off vim-plug.

```vim
if filereadable(expand("~/.vimrc.plugins.after"))
  source ~/.vimrc.plugins.after
endif

call plug#end()
```
