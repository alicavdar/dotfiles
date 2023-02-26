-- Set barbar's options
require('bufferline').setup {
  -- Enable/disable animations
  animation = false,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = false,

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = false,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '',
  icon_separator_inactive = '',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = true,
  insert_at_start = false,

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = "-",

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,
}

vim.keymap.set("n", "gn", "<Cmd>BufferNext<CR>", { remap = false, silent = true })
vim.keymap.set("n", "gp", "<Cmd>BufferPrevious<CR>", { remap = false, silent = true })
vim.keymap.set("n", "<leader>d", "<Cmd>BufferClose<CR>", { remap = false })
