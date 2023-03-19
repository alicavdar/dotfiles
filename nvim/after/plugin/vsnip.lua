-- Do not mix <Plug> with the package manager
-- Run `:h Plug`
vim.api.nvim_command([[imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']])
