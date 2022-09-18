-- Gruvbox Theme
-- -- [hard, medium, soft]
-- -- [material, mix, original]
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_ui_contrast = "low"

-- Vim JSX Pretty
vim.g.vim_jsx_pretty_colorful_config = 1

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

-- NERDTree Config
vim.g.NERDTreeShowHidden = 0
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeIgnore = {'node_modules', '.next', 'coverage'}
vim.g.NERDTreeWinSize = 35
vim.g.NERDTreeDirArrowExpandable = "🞂" -- disable on mac
vim.g.NERDTreeDirArrowCollapsible = "🞃" -- disable on mac
 
-- NERDCommenter Config
vim.g.NERDSpaceDelims = 1  
vim.g.NERDTrimTrailingWhitespace = 1 
vim.g.NERDCompactSexyComs = 1

-- Vue Plugin Config
vim.g.vue_pre_processors = {'sass', 'scss', 'javascript'}

-- GitGutter Config
vim.g.gitgutter_sign_added = "∣" 
vim.g.gitgutter_sign_modified = "∣"
vim.g.gitgutter_sign_removed = "🞂"
vim.g.gitgutter_sign_removed_first_line = "↟"
vim.g.gitgutter_sign_removed_above_and_below = "♦"
vim.g.gitgutter_sign_modified_removed = "∣"

-- Lualine
require('lualine').setup {
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
      modified = ' ●',
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch','diff'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {},
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
}

-- Tabline
require('tabline').setup({
    show_index = true,
    show_modify = true,
    modify_indicator = '●',
    no_name = 'No name',
})

-- LSP Installer
require("nvim-lsp-installer").setup {}

-- Treesitter
require'nvim-treesitter.configs'.setup {
  sync_install = false,
  auto_install = false,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Prettier
local prettier = require("prettier")
prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
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

-- Telescope
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<ESC>"] = actions.close,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        [";;"] = { "<ESC>", type = "command" },
      }
    }
  }
}
