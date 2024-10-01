vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sb", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sj", "<C-w>j")
keymap.set("n", "<leader>sk", "<C-w>k")
keymap.set("n", "<leader>,", "<C-w>h")
keymap.set("n", "<leader>.", "<C-w>l")
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

