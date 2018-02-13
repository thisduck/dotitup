if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" command -nargs=+ -complete=file -bar Ag silent grep! <args>|cwindow|redraw!
