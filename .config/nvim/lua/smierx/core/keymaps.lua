--TODO: In Which-key einfügen
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
keymap.set("n", "<leader>,", "<C-w>h") -- move window left
keymap.set("n", "<leader>.", "<C-w>l") -- move window right
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

exitTerm = function ()
    vim.cmd(":ToggleTerm");
end

keymap.set("t","<esc><esc>",exitTerm)
