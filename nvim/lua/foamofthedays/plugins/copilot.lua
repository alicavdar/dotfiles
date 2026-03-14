return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      text = false,
      env = false,
    }
  end,
}
