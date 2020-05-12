```vim
" for fpath in split(globpath('~/.dotvim/settings', '*.md'), '\n')
"   execute literatevimrc#load(fpath)
" endfor

execute literatevimrc#load("~/.dotvim/settings/appearance.md")
execute literatevimrc#load("~/.dotvim/settings/motion.md")
execute literatevimrc#load("~/.dotvim/settings/search.md")
execute literatevimrc#load("~/.dotvim/settings/asyncrun.md")
execute literatevimrc#load("~/.dotvim/settings/editor.md")
execute literatevimrc#load("~/.dotvim/settings/ruby.md")
execute literatevimrc#load("~/.dotvim/settings/terminal.md")

" from https://stackoverflow.com/questions/38560244/vim-colorscheme-not-working-in-terminal-vim-but-working-in-gvim to get colours working properly, don't ask me why.
set t_Co=256 
```
