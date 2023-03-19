-- Hide status bar
vim.g.NERDTreeStatusline = '%#NonText#' 

vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeIgnore = { '.DS_Store' }

-- Toggle NERDTree
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>", { remap = false })

-- Reveal the current buffer in NERDTree window
vim.keymap.set("n", "<C-r>", ":NERDTreeFind<CR>zz", { remap = false })

-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.cmd([[
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])
