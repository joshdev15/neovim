call plug#begin('~/.config/nvim/plugged')
  
" Syntax / Languaje
  Plug 'sheerun/vim-polyglot'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go Languaje
  Plug 'rust-lang/rust.vim'
  Plug 'styled-components/vim-styled-components'
  
  " Features
  Plug 'preservim/nerdtree' " Sidebar files feature
  Plug 'scrooloose/nerdcommenter' " Comments Support	
  Plug 'itchyny/lightline.vim' " Lightline
  Plug 'tpope/vim-fugitive' " Git Support
  Plug 'airblade/vim-gitgutter' " Git Files Support
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'github/copilot.vim'
  Plug 'editorconfig/editorconfig-vim' " Editorconfig Support
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Plug 'jiangmiao/auto-pairs'
  " Plug 'alvan/vim-closetag'
  " Plug 'tpope/vim-surround'
 

  " Themes & Interface
  Plug 'sainnhe/gruvbox-material' " Retro Theme for Vim in Material Desing
 
  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'} 
  Plug 'yaegassy/coc-volar', {'do': 'yarn install --immutable'}

call plug#end()
