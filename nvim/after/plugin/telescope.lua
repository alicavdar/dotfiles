local builtin = require('telescope.builtin')

-- Enable line numbers
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"

vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>a", builtin.live_grep)
vim.keymap.set("n", "<leader>g", builtin.git_status)
vim.keymap.set("n", "<leader>t", builtin.filetypes)
