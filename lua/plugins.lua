-- ==============================================================================
-- NATIVE PACKAGE MANAGER
-- Este script reemplaza a Lazy.nvim utilizando la funcionalidad nativa de Neovim
-- ==============================================================================

local pack_path = vim.fn.stdpath("data") .. "/site/pack/native/start/"

-- Lista de repositorios de GitHub
local plugins = {
  -- Apariencia y UI
  "catppuccin/nvim",
  "sainnhe/gruvbox-material",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "nanozuki/tabby.nvim",

  -- Herramientas de Desarrollo
  "nvim-tree/nvim-tree.lua",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-surround",

  -- LSP, Mason y Autocompletado
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Go
  "ray-x/guihua.lua",
  "ray-x/go.nvim",

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",

  -- Extras
  "numToStr/Comment.nvim",
  "prettier/vim-prettier",
}

local function bootstrap_plugins()
  local installed_any = false
  
  -- Crear el directorio si no existe
  if vim.fn.isdirectory(pack_path) == 0 then
    vim.fn.mkdir(pack_path, "p")
  end

  for _, repo in ipairs(plugins) do
    local name = repo:match(".*/(.*)")
    local dir = pack_path .. name

    if vim.fn.isdirectory(dir) == 0 then
      print("Clonando " .. name .. "...")
      vim.fn.system({
        "git", "clone", "--depth", "1", "https://github.com/" .. repo, dir
      })
      installed_any = true

      -- Añadir al runtimepath inmediatamente para esta sesión
      vim.opt.rtp:append(dir)
    end
  end

  if installed_any then
    print("Plugins nativos instalados. Es recomendable reiniciar Neovim.")
  end
end

-- Ejecutar el instalador
bootstrap_plugins()

-- ==============================================================================
-- CONFIGURACIÓN DE PLUGINS
-- ==============================================================================

-- Gitsigns
local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if ok_gitsigns then
  gitsigns.setup()
end

-- Comment
local ok_comment, comment = pcall(require, "Comment")
if ok_comment then
  comment.setup()
end

-- Go
local ok_go, go = pcall(require, "go")
if ok_go then
  go.setup({
    lsp_cfg = false,
    luasnip = true,
  })
end

-- Treesitter
local ok_ts, ts = pcall(require, "nvim-treesitter.configs")
if ok_ts then
  ts.setup({
    ensure_installed = { "go", "lua", "typescript", "tsx", "javascript", "html", "css" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  })
end
