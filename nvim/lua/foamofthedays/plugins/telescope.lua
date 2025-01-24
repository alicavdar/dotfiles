return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local extensions = telescope.extensions
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<ESC>"] = actions.close,
            ["<C-j>"] = actions.cycle_history_prev,
            ["<C-k>"] = actions.cycle_history_next,
          },
          n = { ["<ESC>"] = actions.close },
        },
      }
    })

    telescope.load_extension("live_grep_args")

    -- Enable line numbers
    vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"

    vim.keymap.set("n", "<leader>f", builtin.find_files)
    vim.keymap.set("n", "<leader>a", extensions.live_grep_args.live_grep_args)
    vim.keymap.set("n", "<leader>g", builtin.git_status)
    vim.keymap.set("n", "<leader>t", builtin.filetypes)
    vim.keymap.set("n", "<C-p>", builtin.buffers)
    vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
    vim.keymap.set("n", "<leader>r", builtin.resume)
    vim.keymap.set('n', 'gr', function ()
      return builtin.lsp_references({
        show_line = true,
      })
    end)

    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*" },
        command = "normal zx",
    })
  end
}
