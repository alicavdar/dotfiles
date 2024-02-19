return {
  "stevearc/aerial.nvim",
  config = function()
    require('aerial').setup({
      filter_kind = { "Class", "Function", "Module", "Method" },

      layout = { min_width = 0.35 }
    })

    vim.cmd 'command! Sm AerialToggle'
    vim.cmd 'command! Sym AerialToggle'
  end
}
