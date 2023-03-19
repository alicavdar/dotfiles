-- Space as the leader
vim.g.mapleader = " "

-- Easier escape than ESC
vim.keymap.set("i", "jj", "<ESC>", { remap = false }) 

-- Clear search highlighting
vim.keymap.set("n", "<leader>q", ":nohlsearch<CR>")

-- Fast saving
vim.keymap.set("n", "<leader>w", ":w!<CR>")

-- Switch between last visited buffers
vim.keymap.set("n", "<leader>e", ":e#<CR>")
vim.keymap.set("n", "<tab>", ":e#<CR>")

vim.keymap.set("n", "<leader>d", "<cmd>bd<cr>")
vim.keymap.set("n", "gn", "<cmd>bnext<cr>")
vim.keymap.set("n", "gp", "<cmd>bprev<cr>")

-- Easy navigation between windows
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { remap = false })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { remap = false })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { remap = false })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { remap = false })

vim.keymap.set({ "n", "v" }, "H", "^", { remap = false })
vim.keymap.set({ "n", "v" }, "L", "$", { remap = false })

-- use `u` to undo, use `U` to redo
vim.keymap.set("n", "U", "<C-r>", { remap = false })

-- Make search results appear in the middle of the screen
vim.keymap.set("n", "n", "nzz", { remap = false })
vim.keymap.set("n", "N", "Nzz", { remap = false })
vim.keymap.set("n", "*", "*zz", { remap = false })

-- Behave like D and C
vim.keymap.set("n", "Y", "y$", { remap = false })

-- Fixing some annoying typos I often do
-- Such as "q:" instead of ":q"
vim.keymap.set("c", "q:", ":q", { remap = false })
vim.keymap.set("c", "Q!", "q!", { remap = false })
vim.keymap.set("c", "Q", "q", { remap = false })
vim.keymap.set("c", "q1", "q!", { remap = false })
vim.keymap.set("c", "W!", "w!", { remap = false })
vim.keymap.set("c", "Q", "q", { remap = false })
vim.keymap.set("c", "W", "w", { remap = false })
vim.keymap.set("c", "Wq", "wq", { remap = false })
vim.keymap.set("c", "Wa", "wa", { remap = false })
vim.keymap.set("c", "Qa", "qa", { remap = false })
vim.keymap.set("c", "QA", "qa", { remap = false })
vim.keymap.set("c", "Bd", "bd", { remap = false })
vim.keymap.set("c", "bD", "bd", { remap = false })
vim.keymap.set("c", "BD", "bd", { remap = false })
vim.keymap.set("c", "Bd!", "bd!", { remap = false })
vim.keymap.set("c", "bD!", "bd!", { remap = false })
vim.keymap.set("c", "BD!", "bd!", { remap = false })
vim.keymap.set("c", "E!", "e!", { remap = false })

-- Undo break points
vim.keymap.set("i", ",", ",<c-g>u", { remap = false })
vim.keymap.set("i", ".", ".<c-g>u", { remap = false })
vim.keymap.set("i", "!", "!<c-g>u", { remap = false })
vim.keymap.set("i", "?", "?<c-g>u", { remap = false })
vim.keymap.set("i", "<Space>", "<Space><c-g>u", { remap = false })

-- Resize windows with arrow keys
vim.keymap.set("n", "<Left>", "<C-w>>", { remap = false })
vim.keymap.set("n", "<Right>", "<C-w><", { remap = false })
vim.keymap.set("n", "<Up>", "<C-w>-", { remap = false })
vim.keymap.set("n", "<Down>", "<C-w>+", { remap = false })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Do not move cursor after `J`
vim.keymap.set("n", "J", "mzJ`z")

-- Pasta without overriding clipboard
-- vim.keymap.set("x", "<C-p>", [["_dP]])

-- Scrolling via CTRL-D and CTRL-U
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search for visually selected text
vim.keymap.set("v", "//", [[ y/\V<C-R>=escape(@",'/\')<CR><CR> ]], { remap = false })

-- Copy current file name (relative/absolute) to system clipboard
-- Relative path (src/foo.txt)
vim.keymap.set("n", "<leader>cf", [[ :let @*=expand("%")<CR> ]], { remap = false })
-- Absolute path (/something/src/foo.txt)
vim.keymap.set("n", "<leader>cF", [[ :let @*=expand("%:p")<CR> ]], { remap = false })
-- Filename (foo.txt)
vim.keymap.set("n", "<leader>ct", [[ :let @*=expand("%:t")<CR> ]], { remap = false })

-- Moving the cursor through long soft-wrapped lines
vim.api.nvim_command([[ nnoremap <expr> k (v:count == 0 ? 'gk' : 'k') ]])
vim.api.nvim_command([[ nnoremap <expr> j (v:count == 0 ? 'gj' : 'j') ]])

vim.keymap.set("n", "<Space><Space>", ":lua print(vim.fn.expand('%'))<CR>")
