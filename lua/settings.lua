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

-- Everforest Theme
vim.g.everforest_background = 'hard'
vim.g.gruvbox_material_foreground = 'mix'
vim.g.everforest_better_performance = 1
vim.g.everforest_transparent_background = 2
vim.g.everforest_ui_contrast = 'low'

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
      modified = '✻',
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
    modify_indicator = '✻',
    no_name = 'No name',
    show_index_filename = false,
    show_styles_filename = false,
})

-- LSP Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- Treesitter
require'nvim-treesitter.configs'.setup {
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "typescript",
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  },
  rainbow = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  context_commentstring = {
    enable = true
  }
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
