vim.opt.updatetime = 50
vim.opt.number  = true			-- Show line numbers
vim.opt.relativenumber = true		-- Enable relative numbers
vim.opt.smartcase = true		-- When searching try to be smart about cases
vim.opt.ignorecase = true		-- Ignore case of searches
vim.opt.hlsearch = false		-- Don't highlight searches
vim.opt.incsearch = true		-- Show search matches when typing
vim.opt.backup = false			-- Don't create backup files
vim.opt.swapfile = false		-- Don't use swap files
vim.opt.hidden = true			-- Switch between buffers without having to save first
vim.opt.smarttab = true			-- Enable smarttab
vim.opt.autoread = true			-- Auto refresh if the file has been changed outside of VIM
vim.opt.wildmenu = true			-- Enhance command-line completion
vim.opt.cursorline = false		-- Hide cursorline
vim.opt.linebreak = true		-- Break long lines by word, not char
vim.opt.scroll = 10			-- Number of lines to scroll with ^U/^D
vim.opt.splitright = true		-- Open new windows below the current window.
vim.opt.splitbelow = true		-- Open new windows right of the current window.
vim.opt.signcolumn = "yes"		-- Always show the sign column
vim.opt.termguicolors = true		-- Enable true colors
vim.opt.shortmess:append("c")		-- Don't pass messages to |ins-completion-menu|
vim.opt.mouse = "a"			-- Enable mouse
vim.opt.clipboard = "unnamed"		-- Yank to system clipboard
vim.opt.backspace = "indent,eol,start"	-- Make backspace work as expected

vim.opt.smartindent = true
vim.opt.autoindent = true   -- Indent according to previous line
vim.opt.expandtab =  true   -- Use spaces instead of tabs
vim.opt.softtabstop = 2     -- Tab key indents by 2 spaces
vim.opt.shiftwidth= 2       -- indents by 2 spaces
vim.opt.shiftround = true   -- >> indents to next multiple of 'shiftwidth'

-- Hide status bar
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.opt.showcmd = false
vim.opt.showmode = false

-- Undo history
vim.opt.undofile = true
-- vim.opt.undodir = "~/.vim/undo"

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*' },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})


vim.cmd([[
  let &fcs='eob: ' " Hide the tilde (~) sign on blank lines

  set background=dark
  let g:sonokai_transparent_background = 1
  colorscheme sonokai
  highlight Search guibg=peru guifg=wheat
]])

