local ensure_installed = {
  'gopls', 'html', 'eslint', 'ts_ls',
  'lua_ls', 'elixirls', 'tailwindcss', 'clangd',
  'terraformls', 'denols'
}

local server_configs = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        hint = { enable = true },
      }
    }
  },

  ts_ls = function (lspconfig)
    return {
      root_dir = lspconfig.util.root_pattern("package.json"),
      single_file_support = true,
    }
  end,

  denols = function (lspconfig)
    return {
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
    }
  end
}

local function get_server_config(server_name, lspconfig)
  local config = server_configs[server_name]

  if not config then
    return nil
  end

  if type(config) == "function" then
    return config(lspconfig)
  end

  return config
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local blink_cmp = require("blink.cmp")

    local base_server_config = {
      capabilities = blink_cmp.get_lsp_capabilities(),
      on_attach = function (_, bufnr)
        local opts = {buffer = bufnr, remap = false}

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
    }

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
      handlers = {
        function(server_name)
          local server_config = vim.tbl_deep_extend(
            "force",
            base_server_config,
            get_server_config(server_name, lspconfig) or {}
          )

          lspconfig[server_name].setup(server_config)
        end,
      }
    })

    vim.diagnostic.config({ signs = false })
  end
}
