require "paq" {
    -- Package Manager
    'savq/paq-nvim';

    -- Syntax
    'sheerun/vim-polyglot';
    {'fatih/vim-go',  run = ':GoUpdateBinaries' };
    'rust-lang/rust.vim';
    'styled-components/vim-styled-components';
  
    -- Features
    'preservim/nerdtree';
    'scrooloose/nerdcommenter';
    -- 'itchyny/lightline.vim';
    'tpope/vim-fugitive';
    'airblade/vim-gitgutter';
    'junegunn/fzf';
    'junegunn/fzf.vim';
    'github/copilot.vim';
    'editorconfig/editorconfig-vim';
    'editorconfig/editorconfig-vim';
    'nvim-lualine/lualine.nvim';
    'joshdev15/nvim-tabline';

    -- Themes
    'sainnhe/gruvbox-material';
 
    -- Coc
    'neoclide/coc.nvim';
    {'yaegassy/coc-volar', run = 'yarn install --immutable'};
}
