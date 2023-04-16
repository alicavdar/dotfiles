local lsp = require('lsp-zero')

lsp.preset('minimal')
lsp.ensure_installed({ 'tsserver' })

-- Fixes "Undefined global vim warnings"
lsp.nvim_workspace()

local cmp = require('cmp')

cmp.setup({
  enabled = true,
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item()
  }),
  sources = cmp.config.sources({
    -- Don't suggest Text from nvm_lsp
    {
      name = "nvim_lsp",
      entry_filter = function(entry, ctx)
        return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
      end
    },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

lsp.set_preferences({
  suggest_lsp_servers = false,
})

local function zz(func_param)
  func_param()
  vim.api.nvim_feedkeys("zz", "n", false)
end

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set('n', '<C-e>', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'g[', function() zz(vim.diagnostic.goto_prev) end, opts)
  vim.keymap.set('n', 'g]', function() zz(vim.diagnostic.goto_next) end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})

