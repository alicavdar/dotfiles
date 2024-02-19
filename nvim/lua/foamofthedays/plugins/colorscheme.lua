return {
  "sainnhe/sonokai",
  config = function()
    vim.cmd([[
      set background=dark
      let g:sonokai_transparent_background = 1
      colorscheme sonokai

      highlight CleverFDefaultLabel guibg=NONE guifg=red
      highlight FloatBorder guibg=NONE guifg=#a2c44f
      highlight NormalFloat guibg=NONE guifg=#a2c44f
      highlight ErrorFloat guibg=NONE guifg=#a2c44f
      highlight HintFloat guibg=NONE guifg=#a2c44f
      highlight CursorLine guibg=#1b1b1c
    ]])
  end
}
