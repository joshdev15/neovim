
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
" :noremap <C-n> :NERDTreeToggle<CR>

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

:noremap <C-p> :call OpenSearch()<cr>
:noremap <C-f> :call OpenSuperSearch()<cr>
:noremap <C-s> :call GitStatus()<cr>

" Copy File
function! Copy() 
  exe ":!xclip -selection clipboard < %"
  echo "Copy File"
endfunction

:noremap <Leader>ff :call Copy()<cr>

" Coc Maps
:noremap <Leader>p :CocCommand prettier.formatFile<cr>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

"  function! Fugitive()
"    if exists('*FugitiveHead')
"      vim.g.branch = FugitiveHead()
"      " return branch !=# '' ? " ".branch : ''
"      return branch !=# '' ? branch : ''
"    endif
"    return ''
"  endfunction

"  function! IsReadonly()
"    return &readonly ? "🔒" : ''
"  endfunction
