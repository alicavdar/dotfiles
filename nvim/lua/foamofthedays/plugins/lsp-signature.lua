return {
  "ray-x/lsp_signature.nvim",
  tag = "v0.3.1",
  config = function()
    require 'lsp_signature'.setup({
      hint_prefix = '',
      floating_window = false,
    })
  end
}
