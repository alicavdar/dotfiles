return {
  "tpope/vim-fugitive",
  config = function()
    vim.api.nvim_create_user_command("Blame", ":G blame", {})
  end
}
