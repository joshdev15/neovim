" My vimrc config file
" My linux filesystem compatible config
"
" Link with vim settings
" Vincular con la configuracion de vim
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc

set number
set rnu
set numberwidth=1
set clipboard=unnamed
set noswapfile
set nobackup
set t_Co=256k
set background=dark
set showmatch
set noshowmode
set sw=2
set hlsearch
set linebreak
set incsearch
set termguicolors
set scrolloff=10
set signcolumn=yes
set ignorecase
set updatetime=300
set undofile
set undodir=~/.config/nvim/undo
set undolevels=50
" set mouse=a

syntax enable
filetype plugin indent on

so ~/.config/nvim/plugins.vim
so ~/.config/nvim/config.vim
so ~/.config/nvim/maps.vim

colorscheme gruvbox-material
