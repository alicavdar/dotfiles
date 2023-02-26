-- Use ag (the silver searcher as default)
vim.env.FZF_DEFAULT_COMMAND = 'ag --ignore "*.tgz" -g ""' 

vim.keymap.set("n", "<leader>a", ":Ag<Space>", { remap = false })
vim.keymap.set("n", "<leader>f", ":Files<CR>", { remap = true })
vim.keymap.set("n", "<leader>g", ":FzfPreviewGitStatusRpc<CR>", { remap = false })
vim.keymap.set("n", "<leader>t", ":Filetypes<CR>", { remap = false })
