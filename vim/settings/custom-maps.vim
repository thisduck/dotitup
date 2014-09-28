" copy to clipboard
map <Leader>y "*y

" from gary b
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>nn :call RenameFile()<cr>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Index ctags from any project, including those outside Rails
map <Leader>ct :!/usr/local/bin/ctags -R .<CR><CR>

set shell=/bin/sh

" Nagivate cwindows and tags
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>N :cprev<CR>
nnoremap <Leader>t :tnext<CR>
nnoremap <Leader>T :tprev<CR>

" toggle set paste
nnoremap <Leader>pp :set invpaste<CR>:set paste?<CR>

set updatetime=750
set timeoutlen=500

" Tomorrow-Night compatible diff colours.
highlight DiffChange term=reverse cterm=bold ctermbg=229 ctermfg=244
highlight DiffText term=reverse cterm=bold ctermbg=011 ctermfg=232

highlight DiffAdd term=reverse cterm=bold ctermbg=108 ctermfg=235
highlight DiffDelete term=reverse cterm=bold ctermbg=052 ctermfg=243

function! Preserve(command) "{{{
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  execute a:command
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction "}}}

function! StripTrailingWhitespace() "{{{
  call Preserve("%s/\\s\\+$//e")
endfunction "}}}

nmap <leader>fef :call Preserve("normal gg=G")<CR>
nmap <leader>f$ :call StripTrailingWhitespace()<CR>
vmap <leader>s :sort<cr>

" ---

set nowrap
set showbreak=⇇

" ---

nnoremap <C-]> g<C-]>

" ---

let g:notes_directories = ['~/Desktop/vim-notes']


set rtp+=~/.vim/custom/
let g:UltiSnipsSnippetDirectories=["UltiSnips", 'dotitup_snippets']

" ---

let g:session_autosave='yes'
let g:session_autoload = 'no'

" ---

autocmd FileType ruby set iskeyword+=?,!

" --- Replace old style ruby hashes with new style
map <Leader>> :s<Home>silent! <End>@:\([^: =({})]\+\)\s*=>\s*@\1: @g<CR> :set nohlsearch<CR>

" --- Break up a long ruby line
" map <Leader>bb :s<Home>silent! <End>@,\(?!$\)@,\r@g<CR> 
"       \ :s<Home>silent! <End>@}@\r}@g<CR> 
"       \ :s<Home>silent! <End>@{@{\r@g<CR> 
"       \ :s<Home>silent! <End>@(@(\r@g<CR> 
"       \ :s<Home>silent! <End>@)@\r)@g<CR> 
"       \ =
"       \ :set nohlsearch<CR>
"       " \ :silent! s@&@&\r@g<CR> 
