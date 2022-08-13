call plug#begin('~/.config/nvim/plugged')
  
  " Syntax / Languaje
  Plug 'sheerun/vim-polyglot'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go Languaje
  
  " Features
  Plug 'preservim/nerdtree' " Sidebar files feature
  Plug 'itchyny/lightline.vim' " Lightline
  Plug 'editorconfig/editorconfig-vim' " Editorconfig Support
  Plug 'tpope/vim-fugitive' " Git Support
  Plug 'airblade/vim-gitgutter' " Git Files Support
  Plug 'scrooloose/nerdcommenter' " Comments Support	
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " Themes & Interface
  Plug 'sainnhe/gruvbox-material' " Retro Theme for Vim in Material Desing

  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'} 

call plug#end()
