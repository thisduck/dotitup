```vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'

let g:coc_global_extensions = [
\ 'coc-prettier',
\ 'coc-eslint',
\ 'coc-css',
\ 'coc-highlight',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-yaml',
\ 'coc-snippets',
\ 'coc-solargraph',
\ 'coc-git',
\ 'coc-markdownlint',
\ 'coc-lists',
\ 'coc-actions',
\ 'coc-emmet',
\ 'coc-svelte',
\ 'coc-svg',
\ 'coc-vimlsp',
\ 'coc-pairs',
\ 'coc-tag',
\ 'coc-syntax',
\ 'coc-emoji',
\ 'coc-ember'
\ ]

set shortmess+=c

inoremap <silent><expr> <C-Space>
      \ pumvisible() ? "\<C-y>" :
      \ "\<C-r>=coc#refresh()\<CR>\<C-n>"

inoremap <expr> <C-c> pumvisible() ? "\<C-[>" : "\<C-c>"
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

" Life saver: https://xdg.me/blog/combining-vim-closer-with-pumvisible/
function! EnterOnMenu() abort
  return pumvisible() ? "\<C-e>\<CR>" : "\<CR>\<c-r>=coc#on_enter()\<CR>"
endfunction
inoremap <silent> <CR> <C-R>=EnterOnMenu()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> L :call <SID>show_documentation()<CR>

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
```
