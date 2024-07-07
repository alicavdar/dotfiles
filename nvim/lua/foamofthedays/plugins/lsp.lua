return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function ()
        require("luasnip.loaders.from_vscode").load()
      end
    },
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local luasnip = require("luasnip")

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    local function on_attach(_client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      vim.keymap.set('n', '<C-e>', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<C-h>', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, opts)
    end

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        'gopls', 'html', 'eslint', 'tsserver',
        'lua_ls', 'elixirls', 'tailwindcss',
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            }
          }
        end,

        -- Don't know why but we need to attach lua_ls manually here
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                },
                hint = { enable = true },
              }
            }
          }
        end,
      }
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping(function() luasnip.expand() end, { "i" }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` 
    -- This won't work when `native_menu` is enabled
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' 
    -- This won't work when `native_menu` is enabled
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    vim.diagnostic.config({
      virtual_text = true,
      signs = false,
    })
  end
}
