-- NEOVIM CONFIGURATION --

-- Custom Settings
local o = vim.o
local bo = vim.bo
local set = vim.opt

-- Global Options
o.t_Co = "256k" 

-- Optional Settings
set.sw = 2
set.rnu = true
set.number = true
set.mouse = ''
set.numberwidth = 2
set.clipboard = "unnamedplus" 
set.swapfile = false
set.backup = false
set.background = "dark"
set.showmatch = true
set.showmode = false
set.hlsearch = true
set.termguicolors = true
set.scrolloff = 10
set.signcolumn = "yes"
set.ignorecase = true
set.updatetime = 300
set.splitright = true

-- Custom Maps
require "maps"

-- Plugins Settings
require "settings"

-- LSP Settings
require "lsp"

-- Snippets Settings
-- require "snippets"

-- vim.cmd([[colorscheme tokyonight-night]])
vim.cmd([[colorscheme gruvbox-material]])
-- vim.cmd([[colorscheme darcula]])
