require('aerial').setup({
  filter_kind = false,

  layout = { min_width = 0.35 }
})

vim.cmd 'command! Sm AerialToggle'
vim.cmd 'command! Sym AerialToggle'
