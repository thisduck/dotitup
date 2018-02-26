for fpath in split(globpath('~/.dotvim/settings', '*.vim'), '\n')
  exe 'source' fpath
endfor
