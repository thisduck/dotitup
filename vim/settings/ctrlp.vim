if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

let g:ctrlp_working_path_mode = 'r'

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 0

let g:yankring_replace_n_pkey = '<C-t>'
let g:ctrlp_map = '<C-p>'
nnoremap <silent> <Leader>p :CtrlP<CR>
nmap <silent> <C-p> :CtrlP<CR>

" Additional mapping for buffer search
nnoremap <silent> <Leader>pb :CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map <Leader>pa :CtrlP app/assets<CR>
map <Leader>pm :CtrlP app/models<CR>
map <Leader>pc :CtrlP app/controllers<CR>
map <Leader>pv :CtrlP app/views<CR>
map <Leader>ph :CtrlP app/helpers<CR>
map <Leader>pl :CtrlP lib<CR>
map <Leader>pp :CtrlP public<CR>
map <Leader>ps :CtrlP spec<CR>
map <Leader>pd :CtrlP db<CR>
map <Leader>pC :CtrlP config<CR>
map <Leader>pV :CtrlP vendor<CR>
map <Leader>pF :CtrlP factories<CR>
map <Leader>pT :CtrlP test<CR>

nnoremap <silent> <Leader>pt :CtrlPTag<CR>

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

