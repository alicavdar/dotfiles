local ensure_installed = {
  'gopls', 'html', 'eslint', 'ts_ls',
  'lua_ls', 'elixirls', 'tailwindcss', 'clangd',
  'terraformls',
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "j-hui/fidget.nvim",
  },
  config = function()
    require("fidget").setup()
    require("mason").setup()
    require("mason-lspconfig").setup()

    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }
        vim.keymap.set('n', '<C-e>', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
      end,
    })

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        }
      }
    })

    vim.diagnostic.config({ signs = false })
  end
}
