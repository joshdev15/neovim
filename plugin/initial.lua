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

		-- Languages & Syntax
		use 'sheerun/vim-polyglot'
		use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
		use 'rust-lang/rust.vim'
		use 'styled-components/vim-styled-components'
		use 'ap/vim-css-color'
		use 'neovim/nvim-lspconfig'
		use { 'prettier/vim-prettier',  run = 'yarn install --frozen-lockfile --production' }

		-- Features
		use 'preservim/nerdtree'
		use 'scrooloose/nerdcommenter'
		use 'tpope/vim-fugitive'
		use 'airblade/vim-gitgutter'
		use 'junegunn/fzf'
		use 'junegunn/fzf.vim'
		use 'github/copilot.vim'
		use 'editorconfig/editorconfig-vim'
		use 'nvim-lualine/lualine.nvim'
		use 'joshdev15/nvim-tabline'
		use 'alvan/vim-closetag'
		use 'tpope/vim-surround'
		use 'jiangmiao/auto-pairs'
		use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
		use 'hrsh7th/nvim-cmp'
  	use 'hrsh7th/cmp-nvim-lsp'
  	use 'saadparwaiz1/cmp_luasnip'
  	use 'L3MON4D3/LuaSnip'
		use 'nvim-lua/plenary.nvim'
		use ('jose-elias-alvarez/null-ls.nvim')
		use ('MunifTanjim/prettier.nvim')

		-- Themes
		use 'sainnhe/gruvbox-material'

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
