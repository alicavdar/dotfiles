local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({ 'tsserver' })

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  enabled = true,
  preselect = cmp.PreselectMode.Item,
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set('n', '<C-e>', function() vim.lsp.diagnostic.show_line_diagnostics() end, opts)
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', 'g[', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', 'g]', function() vim.diagnostic.goto_next() end, opts)
end)


lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
  signs = false,
})
