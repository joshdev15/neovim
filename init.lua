-- NEOVIM CONFIGURATION --

-- Custom Settings
local o = vim.o
local bo = vim.bo
local set = vim.opt

-- Global Options
o.t_Co = "256k" 

-- Optional Settings
set.number = true
set.rnu = true
set.numberwidth = 2
set.clipboard = "unnamedplus" 
set.swapfile = false
set.backup = false
set.background = "dark"
set.showmatch = true
set.showmode = false
set.sw = 2
set.hlsearch = true
set.linebreak = true
set.incsearch = true
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
require "snippets"

-- vim.cmd([[colorscheme tokyonight-night]])
vim.cmd([[colorscheme gruvbox-material]])
