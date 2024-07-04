-- Gruvbox Theme
-- -- [hard, medium, soft]
vim.g.gruvbox_material_background = 'hard'
-- -- [material, mix, original]
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_ui_contrast = 'low'
vim.g.gruvbox_material_visual = 'red background'
vim.g.gruvbox_material_current_word = 'italic'
vim.g.gruvbox_material_transparent_background = 2
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_dim_inactive_windows = 1
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_better_performance = 1

-- Vim JSX Pretty
vim.g.vim_jsx_pretty_colorful_config = 0

-- Vim-Vue
vim.g.vim_vue_plugin_load_full_syntax = 1
vim.g.vim_vue_plugin_use_typescript = 1

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

-- NERDTree Config
vim.g.NERDTreeShowHidden = 0
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeIgnore = {'node_modules', '.next', 'coverage'}
vim.g.NERDTreeWinSize = 35
vim.g.NERDTreeDirArrowExpandable = "→" -- disable on mac
vim.g.NERDTreeDirArrowCollapsible = "↓" -- disable on mac
 
-- NERDCommenter Config
vim.g.NERDSpaceDelims = 1  
vim.g.NERDTrimTrailingWhitespace = 1 
vim.g.NERDCompactSexyComs = 1

-- Vue Plugin Config
vim.g.vue_pre_processors = {'sass', 'scss', 'javascript'}

-- GitGutter Config
vim.g.gitgutter_sign_added = "∣" 
vim.g.gitgutter_sign_modified = "∣"
vim.g.gitgutter_sign_removed = "›"
vim.g.gitgutter_sign_removed_first_line = "𝟷"
vim.g.gitgutter_sign_removed_above_and_below = "↕"
vim.g.gitgutter_sign_modified_removed = "∣"

-- Dart Vim
vim.g.dart_format_on_save = true

-- Lualine
require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = false,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    symbols = {
      modified = '✻',
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch','diff'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'filetype'},
    lualine_y = {'location'},
    lualine_z = {'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

-- TABBY --
vim.o.showtabline = 2

require('tabby.tabline').set(function(line)
  return {
    {
      { '  </>  ', hl = 'TabLine' },
      line.sep('', 'TabLine', 'TabLineFill'),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and 'TabLineSel' or 'TabLine'
      return {
        line.sep('', hl, 'TabLineFill'),
        tab.is_current() and '' or '',
        -- tab.number(),
        tab.name(),
        -- tab.close_btn(''),
        line.sep('', hl, 'TabLineFill'),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      -- return {
        -- line.sep('', 'TabLine', 'TabLineFill'),
        -- win.is_current() and '' or '',
        -- win.buf_name(),
        -- line.sep('', 'TabLine', 'TabLineFill'),
        -- hl = 'TabLine',
        -- margin = ' ',
      -- }
    -- end),
    {
      line.sep('', 'TabLine', 'TabLineFill'),
      { '', hl = 'TabLine' },
    },
    hl = 'TabLineFill',
  }
end)

--Treesitter
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 5000,
  },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx", "typescriptreact" }

vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})

-- Prettier
local prettier = require("prettier")
prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "mjs",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml"
  }
})

