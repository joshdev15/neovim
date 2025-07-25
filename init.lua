--------------------------
-- NEOVIM CONFIGURATION --
--------------------------

-- Optional Settings
vim.o.syntax = "off"
vim.opt.sw = 2
vim.opt.rnu = true
vim.opt.number = true
vim.opt.mouse = ''
vim.opt.numberwidth = 2
vim.opt.clipboard = "unnamedplus" 
vim.opt.swapfile = false
vim.opt.backup = false
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

-- Vim Settings
require("settings") 

-- Plugins Settings
require("plugins")

-- LSP Settings
require("lsp")

-- Check mac dark mode
-- Disable this if you are not using MacOS
local result = vim.fn.system("defaults read -g AppleInterfaceStyle")
local final = "dark"
if result ~= "Dark\n" then
	final = "light" 
else
	final = "dark"
end

vim.opt.background = final

-- Theme
vim.cmd.colorscheme "catppuccin"

--------------------------
-- The plugins are available in the archive
-- [ROOT]/plugins/initial.lua
