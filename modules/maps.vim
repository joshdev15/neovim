" Vim Custom Maps
let mapleader=' '

:noremap <C-h> <C-w>h
:noremap <C-j> <C-w>j
:noremap <C-k> <C-w>k
:noremap <C-l> <C-w>l
:noremap <Leader>k :tabn<cr>
:noremap <Leader>j :tabp<cr>
:noremap <Leader>w :w<cr>
:noremap <Leader>q :q<cr>
:noremap <Leader>Q :q!<cr>

:noremap <C-w> <C-w>=

:vnoremap ;; <Esc>
:inoremap ;; <Esc>
:xnoremap ;; <Esc>

:vnoremap ññ <Esc>
:inoremap ññ <Esc>
:xnoremap ññ <Esc>

" NERDTree Maps
function! OpenExplorer()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
    echo "Explorer Closed"
  else
    exe ":NERDTreeFind"
    exe ":NERDTreeRefreshRoot"
    echo "Explorer Open"
  endif
endfunction

:noremap <C-n> :call OpenExplorer()<cr>
" " :noremap <C-n> :NERDTreeToggle<CR>

" Fuzzy Finder Maps
function! OpenSearch() 
  exe ":GFiles"
  echo "Open File Browser"
endfunction

function! OpenSuperSearch() 
  exe ":Ag"
  echo "Open Super Search"
endfunction

function! GitStatus()
  exe ":GFiles?"
  echo "Git Status Command"
endfunction

function! GitLog() 
  exe ":Commits"
  echo "Git Log Command"
endfunction

:noremap <C-p> :call OpenSearch()<cr>
:noremap <C-f> :call OpenSuperSearch()<cr>
:noremap <C-s> :call GitStatus()<cr>
:noremap <C-g><C-l> :call GitLog()<cr>

" Copy File
function! Copy() 
  exe ":!xclip -selection clipboard < %"
  echo "Copy File"
endfunction
:noremap <Leader>ff :call Copy()<cr>

" GitGutter Maps
:noremap <Leader>g :GitGutterPreviewHunk<cr>
:noremap <Leader>gg :GitGutterUndoHunk<cr>

" Show Parent Folder
function! ShowRelativeRoute()
  echo expand('%:f:h')
endfunction

:noremap <Leader>sf :call ShowRelativeRoute()<cr>

" Coc Maps
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Prettier / CocPrettier Maps
:noremap <Leader>p :CocCommand prettier.formatFile<cr>

" nnoremap <silent><nowait><expr> <Alt>f coc#float#has_scroll() ? coc#float#scroll(1) : "\<Alt>f"
" nnoremap <silent><nowait><expr> <Alt>b coc#float#has_scroll() ? coc#float#scroll(0) : "\<Alt>b"
" inoremap <silent><nowait><expr> <Alt>f coc#float#has_scroll() ? "\<Alt>f=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <silent><nowait><expr> <Alt>b coc#float#has_scroll() ? "\<Alt>b=coc#float#scroll(0)\<cr>" : "\<Left>"
" vnoremap <silent><nowait><expr> <Alt>f coc#float#has_scroll() ? coc#float#scroll(1) : "\<Alt>f"
" vnoremap <silent><nowait><expr> <Alt>b coc#float#has_scroll() ? coc#float#scroll(0) : "\<Alt>b"
