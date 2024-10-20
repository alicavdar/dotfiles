-- Easier escape than ESC
vim.keymap.set("i", "jj", "<ESC>", { remap = false })

-- Clear search highlighting
vim.keymap.set("n", "<leader>q", ":nohlsearch<CR>")

-- Fast saving
vim.keymap.set("n", "<leader>w", ":w!<CR>")

-- Switch between last visited buffers
vim.keymap.set("n", "<tab>", "<C-S-^>")

-- Buffer navigation
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

-- Behave like D and C
vim.keymap.set("n", "Y", "y$", { remap = false })

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

-- Do not move cursor after `J`
vim.keymap.set("n", "J", "mzJ`z")

-- Scrolling via CTRL-D and CTRL-U
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search for visually selected text
vim.keymap.set("v", "//", [[ y/\V<C-R>=escape(@",'/\')<CR><CR> ]], { remap = false })

-- Moving the cursor through long soft-wrapped lines
vim.api.nvim_command([[ nnoremap <expr> k (v:count == 0 ? 'gk' : 'k') ]])
vim.api.nvim_command([[ nnoremap <expr> j (v:count == 0 ? 'gj' : 'j') ]])

-- Easy navigation through quickfix list
vim.keymap.set("n", "<C-]>", ":cnext<CR>")
vim.keymap.set("n", "<C-[>", ":cprev<CR>")

-- Copy current file name (relative/absolute) to system clipboard
local function copy_path(path)
  return function()
    local copied_path = vim.fn.expand(path)
    vim.fn.setreg("*", copied_path)
    print("Copied to clipboard: " .. copied_path)
  end
end

-- Relative path (src/foo.txt)
vim.keymap.set("n", "<leader>cf", copy_path("%"), { remap = false })
-- Absolute path (/something/src/foo.txt)
vim.keymap.set("n", "<leader>cF", copy_path("%:p"), { remap = false })
-- Filename (foo.txt)
vim.keymap.set("n", "<leader>ct", copy_path("%:t"), { remap = false })

