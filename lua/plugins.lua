-- Plugins Settings --

----------------------------------
-- TABBY -- (Linea de pestañas) --
----------------------------------
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
        tab.name(),
        line.sep('', hl, 'TabLineFill'),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    {
      line.sep('', 'TabLine', 'TabLineFill'),
      { '', hl = 'TabLine' },
    },
    hl = 'TabLineFill',
  }
end)

----------------------------------
-- Lualine -- (Linea de estado) --
----------------------------------
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

--------------
-- Prettier --
--------------
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

----------------
-- Treesitter --
----------------
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
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


----------------------
-- Catppuccin Theme --
----------------------
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = { 'italic' },
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    -- color_overrides = {},
    custom_highlights = function(colors)
        return {
            Pmenu = { bg = '#373754' },
            Float = { bg = '#373754' },
            NormalFloat = { bg = '#373754' },
        }
    end,
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})
