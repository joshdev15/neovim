-- Leader Key 
vim.g.mapleader = ' '

-- Guardado (Mantenemos tu lógica de impresión de mensaje)
vim.keymap.set("n", "<Leader>w", function()
  vim.cmd("w")
  print("File Saved")
end, { desc = "Save file" })

vim.keymap.set("n", "<Leader>W", function()
  vim.cmd("w!")
  print("File Saved (forced)")
end, { desc = "Force save file" })

-- Mapas Básicos (Cerrar)
vim.keymap.set("n", "<Leader>q", ":q<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>Q", ":q!<CR>", { noremap = true })

-- Navegación de Pestañas (Tabby)
vim.keymap.set("n", "<Leader>k", ":tabn<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>j", ":tabp<CR>", { noremap = true })

-- Navegación de Paneles
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-w>", "<C-w>=", { noremap = true })

-- Escapes Teclado Inglés/Español
local escapes = { ";;", "ññ" }
for _, key in ipairs(escapes) do
  vim.keymap.set({ "i", "v", "x" }, key, "<ESC>", { noremap = true })
end

-- Git (Ahora usa Gitsigns en lugar de GitGutter)
vim.keymap.set("n", "<Leader>g", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gg", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })

-- Prettier
vim.keymap.set("n", "<Leader>p", ":Prettier<CR>", { noremap = true, silent = true })

-- Telescope (Sustituye a FZF)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- Similar a GFiles
vim.keymap.set('n', '<C-f>', builtin.live_grep, {}) -- Similar a Ag
vim.keymap.set('n', '<C-s>', builtin.git_status, {}) -- Similar a GFiles?

-- Modo Normal: Comenta la línea actual
vim.keymap.set('n', '<Leader>cc', '<Plug>(comment_toggle_linewise_current)', { noremap = false })

-- Modo Visual: Comenta el bloque seleccionado
vim.keymap.set('x', '<Leader>cc', '<Plug>(comment_toggle_linewise_visual)', { noremap = false })

-- Explorador (Actualizado para NvimTree)
vim.keymap.set("n", "<C-n>", function() OpenExplorer() end, { noremap = true, silent = true })

function OpenExplorer()
  local api = require("nvim-tree.api")
  -- NvimTree tiene su propia lógica de toggle muy optimizada
  api.tree.toggle({ find_file = true, focus = true })
  
  -- Para mantener tu mensaje en consola:
  if api.tree.is_visible() then
    print("Explorer Open")
  else
    print("Explorer Closed")
  end
end
