-------------------------------------------------------------------------------
-- 1. DETECCIÓN DE ENTORNO (iTerm vs Others)
-------------------------------------------------------------------------------
local is_iterm = os.getenv("TERM_PROGRAM") == "iTerm.app"
local is_tmux  = os.getenv("TMUX") ~= nil

local needs_space = is_iterm or is_tmux
local t_left = needs_space and ' ' or ''
local t_right = needs_space and ' ' or ''
local b_left = needs_space and ' ' or ''
local b_right = needs_space and ' ' or ''

-- local t_left = needs_space and '' or ''
-- local t_right = needs_space and '' or ''
-- local b_left = needs_space and '' or ''
-- local b_right = needs_space and '' or ''

-------------------------------------------------------------------------------
-- 2. PLUGINS CONFIG (Vimscript style)
-------------------------------------------------------------------------------
-- Gruvbox Material
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1

vim.g.vim_jsx_pretty_colorful_config = 0

-- GitGutter Signs (Simplificado)
vim.g.gitgutter_sign_added = "∣" 
vim.g.gitgutter_sign_modified = "∣"
vim.g.gitgutter_sign_removed = "›"
vim.g.gitgutter_sign_removed_first_line = "𝟷"
vim.g.gitgutter_sign_removed_above_and_below = "↕"

-- Vim-Go Plugin Config
vim.g.go_fmt_command = "goimports"
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'
vim.g.go_doc_popup_window = 1
vim.g.go_def_reuse_buffer = 0

-------------------------------------------------------------------------------
-- 3. TABBY (Tabline dinámica)
-------------------------------------------------------------------------------
vim.opt.showtabline = 2

require('tabby.tabline').set(function(line)
  return {
    {
      { '   ', hl = 'TabLineSel' },
      line.sep(t_left, 'TabLineSel', 'TabLineFill'),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and 'TabLineSel' or 'TabLine'
      return {
        line.sep(b_right, hl, 'TabLineFill'),
        tab.is_current() and '  ' or '  ',
        tab.name(),
        line.sep(t_left, hl, 'TabLineFill'),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    {
      line.sep(t_right, 'TabLine', 'TabLineFill'),
      { '   ' .. vim.fn.expand('%:t') .. ' ', hl = 'TabLine' },
    },
    hl = 'TabLineFill',
  }
end)

-------------------------------------------------------------------------------
-- 4. NVIM-TREE (Optimizado)
-------------------------------------------------------------------------------
require("nvim-tree").setup({
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "o", function()
      local node = api.tree.get_node_under_cursor()
      api.node.open.edit()
      if node.nodes == nil then api.tree.close() end
    end, opts("Smart Open"))

    vim.keymap.set("n", "<CR>", function()
      local node = api.tree.get_node_under_cursor()
      api.node.open.edit()
      if node.nodes == nil then api.tree.close() end
    end, opts("Smart Open"))

    vim.keymap.set("n", "t", function() api.node.open.tab(); api.tree.close() end, opts("Open Tab"))
    vim.keymap.set("n", "s", function() vim.opt.splitright = true; api.node.open.vertical(); api.tree.close() end, opts("Split Right"))
    vim.keymap.set("n", "i", function() vim.opt.splitright = false; api.node.open.vertical(); api.tree.close() end, opts("Split Left"))
  end,
})

-------------------------------------------------------------------------------
-- 5. LUALINE (Limpieza de opciones innecesarias)
-------------------------------------------------------------------------------
require('lualine').setup({
  options = {
    theme = 'auto',
    globalstatus = true,
    section_separators = { left = b_left, right = b_right },
    component_separators = { left = '', right = '' },
    symbols = { modified = ' ✻' }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'diff'},
    lualine_x = {{'filename', path = 1}},
    lualine_y = {'location'},
    lualine_z = {'progress'}
  }
})
