local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Apariencia y UI
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'sainnhe/gruvbox-material', lazy = false, priority = 1000 },
  { '/gruvbox-material', lazy = false, priority = 1000 },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'nanozuki/tabby.nvim' },

  -- Herramientas de Desarrollo (Sustituyen a NERDTree y GitGutter por opciones en Lua)
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' }, config = true },
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'tpope/vim-surround' },

  -- LSP, Mason y Autocompletado (Tu núcleo de trabajo)
  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp', dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    }
  },

  -- Go
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        lsp_cfg = false, 
        luasnip = true,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()'
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- Usamos pcall para que, si falla, no bloquee todo el editor
      local status, ts = pcall(require, "nvim-treesitter.configs")
      if not status then
          -- Si falla el require antiguo, intentamos inicializarlo de forma básica
          return 
      end
  
      ts.setup({
        ensure_installed = { "go", "lua", "typescript", "tsx", "javascript", "html", "css" },
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },
  {
      'numToStr/Comment.nvim',
      opts = {},
      lazy = false,
  },
  { 'prettier/vim-prettier', build = "yarn install" },
  -- { 'fatih/vim-go', ft = "go" },
})
