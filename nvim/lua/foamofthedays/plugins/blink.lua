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
      list = { selection = 'auto_insert' }
    },
  },
  opts_extend = { 'sources.default' }
}
