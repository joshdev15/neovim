" ------ VimScript Settings ------

" OpenExplorer Function (NerdTree)
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

" OpenExplorer (NerdTree) Map
:noremap <C-n> :call OpenExplorer()<cr>

let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
