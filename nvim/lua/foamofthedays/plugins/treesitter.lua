return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "go", "lua", "python", "rust", "elixir", "heex",
        "tsx", "typescript", "vimdoc", "vim", "html", "c", "terraform",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      indent = {
        enable = true,
      },

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
        },
      },

      textobjects = {
        move = {
          enable = true,

          set_jumps = true, -- whether to set jumps in the jumplist

          goto_next_start = {
            ["+"] = "@function.outer",
            ["]]"] = { query = "@class.outer", desc = "Next class start" },
          },

          goto_previous_start = {
            ["_"] = "@function.outer",
            ["[["] = "@class.outer",
          },
        },
      },
    }
  end
}
