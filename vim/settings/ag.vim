" Open the Ag command and place the cursor into the quotes
nmap <Leader>/ :Ag ""<Left>
" nmap <Leader>/f :AgFile ""<Left>

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

