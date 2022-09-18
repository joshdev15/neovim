" ------ VimScript Settings ------

" OpenExplorer Function (NerdTree)
function! OpenExplorer()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
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
