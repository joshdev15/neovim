" ------ VimScript Settings ------

" OpenExplorer Function (NerdTree)
function! OpenExplorer()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeRefreshRoot"
    exe ":NERDTreeClose"
    echo "Explorer Closed"
  else
    exe ":NERDTreeRefreshRoot"
    exe ":NERDTreeFind"
    echo "Explorer Open"
  endif
endfunction

" OpenExplorer (NerdTree) Map
:noremap <C-n> :call OpenExplorer()<cr>

autocmd BufEnter * :syn sync maxlines=700

" Go Client Plugin Configuration
if exists('g:loaded_hello')
    finish
endif
let g:loaded_hello = 1

function! s:Requirehello(host) abort
    return jobstart(['nvim-go-plug'], {'rpc': v:true})
endfunction

call remote#host#Register('hello', 'x', function('s:Requirehello'))
call remote#host#RegisterPlugin('hello', '0', [
    \ {'type': 'function', 'name': 'Hello', 'sync': 1, 'opts': {}},
    \ ])

call remote#host#Register('greet', 'x', function('s:Requirehello'))
call remote#host#RegisterPlugin('greet', '0', [
    \ {'type': 'function', 'name': 'Greet', 'sync': 1, 'opts': {}},
    \ ])
