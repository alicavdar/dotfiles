return {
  "sbdchd/neoformat",
  config = function()
    -- Format the current buffer
    vim.keymap.set("n", "<Leader>p", ":Neoformat<CR>")
  end
}
