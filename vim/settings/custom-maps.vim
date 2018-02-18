"" copy to clipboard
map <Leader>y "*y

"" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"" Index ctags from any project, including those outside Rails
map <Leader>ct :AsyncRun! ctags -R .<CR><CR>

"" Nagivate cwindows and tags
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>N :cprev<CR>
nnoremap <Leader>t :tnext<CR>
nnoremap <Leader>T :tprev<CR>

"" toggle set paste
nnoremap <Leader>pp :set invpaste<CR>:set paste?<CR>
nnoremap <Leader><Leader>p :set invpaste<CR>:set paste?<CR>

set updatetime=250
set timeoutlen=500


vmap <leader>s :sort<cr>

"" ---

inoremap <c-c> <ESC>

"" ---

set showbreak=⇇
set wrap

"" --- Taken from vim-ruby to map <C-]> to g<C-]>

nnoremap <silent> <script> <buffer> <C-]>      :<C-U>exe         "tjump <C-R>=RubyCursorIdentifier()<CR>"<SID>foldopen<CR>

"" ---

let g:notes_directories = ['~/Desktop/vim-notes']


set rtp+=~/.vim/custom/

"" ---

" autocmd FileType ruby set iskeyword+=?,!

"" --- Replace old style ruby hashes with new style
map <Leader>> :s<Home>silent! <End>@:\([^: =({})]\+\)\s*=>\s*@\1: @g<CR> :nohlsearch<CR>

"" --- Break up a long ruby line
" map <Leader>bb :s<Home>silent! <End>@,\(?!$\)@,\r@g<CR> 
"       \ :s<Home>silent! <End>@}@\r}@g<CR> 
"       \ :s<Home>silent! <End>@{@{\r@g<CR> 
"       \ :s<Home>silent! <End>@(@(\r@g<CR> 
"       \ :s<Home>silent! <End>@)@\r)@g<CR> 
"       \ =
"       \ :set nohlsearch<CR>
"       " \ :silent! s@&@&\r@g<CR> 

set background=light
