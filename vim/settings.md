```vim
for fpath in split(globpath('~/.dotvim/settings', '*.md'), '\n')
  execute literatevimrc#load(fpath)
endfor
```
