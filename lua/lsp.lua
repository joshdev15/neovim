-- NVIM LSP CONFIGURATION

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  print(bufopts)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- Adding servers to lspconfig
local servers = { 'ts_ls', 'cssls', 'html', 'jsonls' }
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
      on_attach = on_attach,
      capabilities = {},
  })
end

-- NVIM CMP setup
local cmp = require('cmp')
local luasnip = require('luasnip')
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
  sources = cmp.config.sources(
    {
      { name = 'buffer' },
      { name = 'path' }
    }, {
--       { name = 'nvim_lsp' },
--       { name = 'luasnip' }
  })
}

-- LSP Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- LSP: Local Go Server
-- lspconfig.gopls.setup({})

