vim.opt.updatetime = 50
vim.opt.number = true                   -- Show line numbers
vim.opt.relativenumber = true           -- Enable relative numbers
vim.opt.smartcase = true                -- When searching try to be smart about cases
vim.opt.ignorecase = true               -- Ignore case of searches
vim.opt.hlsearch = false                -- Don't highlight searches
vim.opt.incsearch = true                -- Show search matches when typing
vim.opt.backup = false                  -- Don't create backup files
vim.opt.swapfile = false                -- Don't use swap files
vim.opt.hidden = true                   -- Switch between buffers without having to save first
vim.opt.smarttab = true                 -- Enable smarttab
vim.opt.autoread = true                 -- Auto refresh if the file has been changed outside of VIM
vim.opt.cursorline = true               -- Show cursorline
vim.opt.linebreak = true                -- Break long lines by word, not char
vim.opt.splitright = true               -- Open new windows below the current window.
vim.opt.splitbelow = true               -- Open new windows right of the current window.
vim.opt.signcolumn = "yes"              -- Always show the sign column
vim.opt.termguicolors = true            -- Enable true colors
vim.opt.shortmess:append("c")           -- Don't pass messages to |ins-completion-menu|
vim.opt.shortmess:append("I")           -- Hide NVIM's intro message
vim.opt.mouse = "a"                     -- Enable mouse
vim.opt.clipboard = "unnamed"           -- Yank to system clipboard
vim.opt.backspace = "indent,eol,start"  -- Make backspace work as expected
vim.opt.scrolloff = 5                   -- Always show at least 5 lines above/below the cursor
vim.opt.fillchars = "eob: "             -- Hide the tilde (~) sign on blank lines
vim.opt.exrc = true                     -- Use local configuration files

-- Indentation
vim.opt.smartindent = true
vim.opt.autoindent = true   -- Indent according to previous line
vim.opt.expandtab =  true   -- Use spaces instead of tabs
vim.opt.softtabstop = 2     -- Tab key indents by 2 spaces
vim.opt.shiftwidth = 2      -- indents by 2 spaces
vim.opt.shiftround = true   -- >> indents to next multiple of 'shiftwidth'

-- Hide status bar
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.opt.showcmd = false
vim.opt.showmode = false

-- Number of lines to scroll with ^U/^D
-- Somehow, the options for the status bar override this if it's defined beforehand
vim.opt.scroll = 10

-- Folding
vim.opt.foldlevel = 20 -- Opens all folds when opening a file
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Completion menu transparency
vim.opt.pumblend = 15

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

-- https://nanotipsforvim.prose.sh/treesitter-and-lsp-support-for-zsh
vim.filetype.add {
  extension = {
    zsh = "sh",
    sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
  },
  filename = {
    [".zshrc"] = "sh",
    [".zshenv"] = "sh",
  },
}

