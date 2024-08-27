return {
  "tpope/vim-fugitive",
  config = function()
    vim.api.nvim_create_user_command("Blame", ":G blame", {})
    vim.api.nvim_create_user_command("Gblame", ":G blame", {})
    vim.api.nvim_create_user_command("GBlame", ":G blame", {})
  end
}
