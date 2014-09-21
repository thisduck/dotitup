if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 1
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 0

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

let g:yankring_replace_n_pkey = '<C-t>'
let g:ctrlp_map = '<C-p>'
nnoremap <silent> <Leader>p :CtrlP<CR>
nmap <silent> <C-p> :CtrlP<CR>

let g:ctrlp_custom_ignore = 'tmp'

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

nnoremap <silent> <Leader>pt :CtrlPBufTag<CR>

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

