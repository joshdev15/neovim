-- 1. CONFIGURACIÓN GLOBAL DE DIAGNÓSTICOS
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- 2. FUNCIÓN PARA MAPEOS (gd, gr, etc.)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf, noremap = true, silent = true }

    -- Mapeos de navegación
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    -- Auto-formateo al guardar
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = event.buf, id = client.id, async = false })
          
          -- Lógica específica para GO
          if vim.bo.filetype == 'go' then
            local params = vim.lsp.util.make_range_params()
            params.context = {only = {'source.organizeImports'}}
            local result = vim.lsp.buf_request_sync(event.buf, 'textDocument/codeAction', params, 1000)
            for _, res in pairs(result or {}) do
              for _, r in pairs(res.result or {}) do
                if r.edit then vim.lsp.util.apply_workspace_edit(r.edit, 'utf-8') end
              end
            end
          end
        end,
      })
    end
  end,
})

-- 3. CONFIGURACIÓN DE LOS SERVIDORES (API Nativa 0.11)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configuración para Go
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  capabilities = capabilities,
  root_markers = { 'go.work', 'go.mod', '.git' },
})

-- Configuración para TypeScript/React (Next.js)
vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  settings = {
    typescript = { preferences = { importModuleSpecifierPreference = 'non-relative' } },
    javascript = { preferences = { importModuleSpecifierPreference = 'non-relative' } },
  },
})

-- Habilitar los servidores
local servers = { 'gopls', 'ts_ls', 'html', 'cssls' }
for _, name in ipairs(servers) do
  vim.lsp.enable(name)
end

-- 4. CONFIGURACIÓN DE AUTOCOMPLETADO (CMP)
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback() end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- 5. EXTRAS
vim.keymap.set('n', '<Leader>cc', 'gcc', { remap = true })
vim.keymap.set('v', '<Leader>cc', 'gc', { remap = true })

require("mason").setup()
require("mason-lspconfig").setup()
