local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({
  function(use)
    -- Package Manager
    use 'wbthomason/packer.nvim'

    -- Themes
    use 'catppuccin/nvim'
    
    -- Languages & Syntax
    use 'sheerun/vim-polyglot'
    -- use 'styled-components/vim-styled-components'
    use 'ap/vim-css-color'
    use 'fatih/vim-go'
    use { 'prettier/vim-prettier',  run = 'yarn install --frozen-lockfile --production' }
    
    -- LSP
    use {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      run = ":MasonUpdate"
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'nvim-lua/plenary.nvim'
    use 'nvimtools/none-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    use 'L3MON4D3/LuaSnip'
    -- use 'ErichDonGubler/lsp_lines.nvim'
    use 'Isrothy/lualine-diagnostic-message'
    
    -- Features
    use 'preservim/nerdtree'
    use 'scrooloose/nerdcommenter'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    use 'editorconfig/editorconfig-vim'
    use 'nvim-lualine/lualine.nvim'
    use 'tpope/vim-surround'
    use 'junegunn/fzf' 
    use 'junegunn/fzf.vim'
    use 'nanozuki/tabby.nvim'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_install = require('nvim-treesitter.install')
        ts_install.compilers = { "clang" }
        local ts_update = ts_install.update({ with_sync = true })
        ts_update()
      end,
    }

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
