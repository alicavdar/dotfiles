return {
  "tpope/vim-vinegar",
  config = function()
    -- Close netrw buffers automatically
    -- https://github.com/tpope/vim-vinegar/issues/13
    vim.g.netrw_fastbrowse = 0

    -- Show line numbers
    vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
    vim.api.nvim_exec([[
      autocmd FileType netrw setlocal number
    ]], false)
  end
}
