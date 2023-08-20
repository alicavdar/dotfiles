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
vim.opt.cursorline = true		-- Show cursorline
vim.opt.linebreak = true		-- Break long lines by word, not char
vim.opt.scroll = 5			-- Number of lines to scroll with ^U/^D
vim.opt.splitright = true		-- Open new windows below the current window.
vim.opt.splitbelow = true		-- Open new windows right of the current window.
vim.opt.signcolumn = "yes"		-- Always show the sign column
vim.opt.termguicolors = true		-- Enable true colors
vim.opt.shortmess:append("c")		-- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I")		-- Hide NVIM's intro message
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

-- Folding
vim.opt.foldlevel = 20 -- Opens all folds when opening a file
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Completion
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }
vim.opt.wildmenu    = true
vim.opt.wildmode    = "longest:full,full"
vim.opt.wildoptions = "pum" -- Show completion items using the pop-up-menu (pum)
vim.opt.pumblend    = 15 -- completion menu transparency

-- Undo history
vim.opt.undofile = true
vim.opt.undodir  = vim.fn.expand('~/.vim/undo')

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*' },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

vim.cmd([[
  " Hide the tilde (~) sign on blank lines
  let &fcs='eob: '

  set background=dark
  let g:sonokai_transparent_background = 1
  colorscheme sonokai
  highlight CleverFDefaultLabel guibg=NONE guifg=red
  highlight FloatBorder guibg=NONE guifg=#a2c44f
  highlight NormalFloat guibg=NONE guifg=#a2c44f
  highlight ErrorFloat guibg=NONE guifg=#a2c44f
  highlight HintFloat guibg=NONE guifg=#a2c44f
  highlight CursorLine guibg=#1b1b1c

  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]])