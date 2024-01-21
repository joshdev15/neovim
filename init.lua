--------------------------
-- NEOVIM CONFIGURATION --
--------------------------

-- The plugins are available in the archive
-- [ROOT]/plugins/initial.lua

-- Global Options
vim.o.t_Co = "256k" 

-- Optional Settings
vim.opt.sw = 2
vim.opt.rnu = true
vim.opt.number = true
vim.opt.mouse = ''
vim.opt.numberwidth = 2
vim.opt.clipboard = "unnamedplus" 
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.background = "dark"
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.updatetime = 300
vim.opt.splitright = true
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99

-- Custom KeyMaps
require("maps") 

-- Plugins Settings
require("settings") 

-- LSP Settings
require("lsp") 

-- Theme
vim.cmd([[colorscheme gruvbox-material]])
