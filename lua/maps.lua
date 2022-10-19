-- Leader Key 
vim.g.mapleader = ' '

-- SetMap Function 
function SetMap(mode, key, command, remap, silent) 
  vim.api.nvim_set_keymap(mode, key, command, {noremap = remap, silent = silent})
end

-- Basic Maps 
SetMap("n", "<Leader>w", ":w<CR>", false, false)
SetMap("n", "<Leader>q", ":q<CR>", false, false)
SetMap("n", "<Leader>Q", ":q!<CR>", false, false)

-- Tab Navigation
SetMap("n", "<Leader>k", ":tabn<CR>", false, false)
SetMap("n", "<Leader>j", ":tabp<CR>", false, false)

-- Panel Navigation
SetMap("n", "<C-h>", "<C-w>h", true, false)
SetMap("n", "<C-j>", "<C-w>j", true, false)
SetMap("n", "<C-k>", "<C-w>k", true, false)
SetMap("n", "<C-l>", "<C-w>l", true, false)
SetMap("n", "<C-w>", "<C-w>=", true, false)

-- English Escape
SetMap("v", ";;", "<ESC>", true, false)
SetMap("i", ";;", "<ESC>", true, false)
SetMap("x", ";;", "<ESC>", true, false)

-- Spanish Escape
SetMap("v", "ññ", "<ESC>", true, false)
SetMap("i", "ññ", "<ESC>", true, false)
SetMap("x", "ññ", "<ESC>", true, false)

-- GitGutter
SetMap("n", "<Leader>g", ":GitGutterPreviewHunk<CR>", true, false)
SetMap("n", "<Leader>gg", ":GitGutterUndoHunk<CR>", true, false)

-- Prettier
SetMap("n", "<Leader>p", ":Prettier<CR>", true, false)

-- Telescope Maps
SetMap("n", "<C-p>", ":GFiles<CR>", true, false)
SetMap("n", "<C-f>", ":Ag<CR>", true, false)
SetMap("n", "<C-s>", ":GFiles?<CR>", true, false)
