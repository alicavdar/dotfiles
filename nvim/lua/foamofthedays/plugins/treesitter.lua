return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup {
      ensure_installed = {
        "go", "lua", "python", "rust", "elixir", "heex",
        "javascript", "tsx", "typescript", "vimdoc", "vim", "html", "c", "terraform",
      },
      auto_install = true,
    }

    -- Enable treesitter highlighting (builtin in Neovim 0.10+)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- Textobjects
    require("nvim-treesitter-textobjects").setup {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["+"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_previous_start = {
          ["_"] = "@function.outer",
          ["[["] = "@class.outer",
        },
      },
    }
  end
}
