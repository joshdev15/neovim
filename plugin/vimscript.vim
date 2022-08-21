" ------ VimScript Settings ------

" OpenExplorer Function (NerdTreee) 
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

" Fuzzy Finder Functions
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

" Copy All File Content Function
function! Copy() 
  exe ":!xclip -selection clipboard < %"
  echo "Copy File"
endfunction

" OpenExplorer (NerdTreee) Map
:noremap <C-n> :call OpenExplorer()<cr>

" Fuzzy Finder Maps
:noremap <C-p> :call OpenSearch()<cr>
:noremap <C-f> :call OpenSuperSearch()<cr>
:noremap <C-s> :call GitStatus()<cr>

" Copy All File Content Map
:noremap <Leader>ff :call Copy()<cr>
