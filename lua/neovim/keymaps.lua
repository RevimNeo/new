local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NOTE: Quit exit of insert mode
map("i", "jj", "<Esc>", opts)
------------------------------

-- NOTE: Navigate through up, down, left and right using K, J, H and L
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
------------------------------

-- NOTE: Scroll half way up or down
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)
------------------------------

-- NOTE: Projects control
map("n", "<leader>w", "<cmd>w<CR>", opts)

map("n", "<leader>pv", "<cmd>Ex<CR>", opts)
------------------------------

-- NOTE: Neovim controls
map("n", "<leader>q", "<cmd>q<CR>", opts)
map("n", "<leader>qa", "<cmd>qa<CR>", opts)
map("n", "<leader>Q", "<cmd>q!<CR>", opts)
map("n", "<leader>QA", "<cmd>qa!<CR>", opts)
------------------------------
--NOTE: Window esizing
map('n', '<Up>', '<cmd>resize -2<CR>', opts)
map('n', '<Down>', '<cmd>resize +2<CR>', opts)
map('n', '<Left>', '<cmd>vertical resize -2<CR>', opts)
map('n', '<Right>', '<cmd>vertical resize +2<CR>', opts)

-- NOTE: Buffer close instead of <leader>q
map('n', "<leader>bq", "<cmd>bd<CR>", opts)
------------------------------
