-- Show line numbers
vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
vim.api.nvim_exec([[
  autocmd FileType netrw setlocal number
]], false)

