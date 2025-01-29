return {
  'saghen/blink.cmp',
  version = '*',
  opts = {
    keymap = {
      preset = 'default' ,
      ['<CR>'] = { 'accept', 'fallback' },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    completion = {
      list = {
        selection = { preselect = false, auto_insert = true },
      }
    },
  },
  opts_extend = { 'sources.default' }
}
