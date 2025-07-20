-- NVIM LSP CONFIGURATION

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- Adding servers to lspconfig
local lspconfig = require('lspconfig')
local servers = { 'ts_ls', 'cssls', 'html', 'jsonls' }
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- NVIM CMP setup
local cmp = require('cmp')
local luasnip = require 'luasnip'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-S-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		['<C-S-j>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<ESC>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
}

-- Adding diagnostic sign to NVIM
local signs = { Error = "✖", Warn = "↦", Hint = "»", Info = "ｉ" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- LSP: UI
require('lspconfig.ui.windows').default_options.border = 'single'

-- LSP: Local Go Server
lspconfig.gopls.setup({})
lspconfig.golangci_lint_ls.setup({})
lspconfig.kotlin_language_server.setup({})

-- LSP Mason
require("mason").setup()
require("mason-lspconfig").setup()


