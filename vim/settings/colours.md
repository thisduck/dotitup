```vim
" Tomorrow-Night compatible diff colours.
" highlight DiffChange term=reverse cterm=bold ctermbg=229 ctermfg=244
" highlight DiffText term=reverse cterm=bold ctermbg=011 ctermfg=232

" highlight DiffAdd term=reverse cterm=bold ctermbg=108 ctermfg=235
" highlight DiffDelete term=reverse cterm=bold ctermbg=052 ctermfg=243

" from monokai
" hi IncSearch ctermfg=235 ctermbg=186 cterm=NONE guifg=#272822 guibg=#e6db74 gui=NONE
" hi Search ctermfg=NONE ctermbg=NONE cterm=standout guifg=NONE guibg=NONE gui=underline

" from https://stackoverflow.com/questions/38560244/vim-colorscheme-not-working-in-terminal-vim-but-working-in-gvim to get colours working properly, don't ask me why.
set t_Co=256 

hi DeniteSearch ctermfg=235 ctermbg=186 cterm=NONE guifg=#272822 guibg=#e6db74 gui=NONE
hi DeniteCursorLine cterm=reverse
```
