Settings and configurations.

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
```

Allow potential users to retain change settings in a after vimrc.

```vim
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

if filereadable(expand("~/.vimrc.settings.after"))
  source ~/.vimrc.settings.after
endif
```
