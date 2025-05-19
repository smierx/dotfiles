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

exitTerm = function()
	vim.cmd(":ToggleTerm")
end

keymap.set("t", "<esc><esc>", exitTerm)

-- Funktion: aktuelle "Zelle" suchen (zwischen # %%)
local function send_jupyter_cell()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local start = cursor[1]
	local end_line = start

	-- nach oben gehen, bis # %% oder Datei-Anfang
	while start > 1 do
		local line = vim.fn.getline(start)
		if line:match("^%s*# %%%%") then
			break
		end
		start = start - 1
	end

	-- nach unten gehen, bis nächste Zelle oder Datei-Ende
	local last = vim.fn.line("$")
	while end_line < last do
		local line = vim.fn.getline(end_line + 1)
		if line:match("^%s*#%%") then
			break
		end
		end_line = end_line + 1
	end

	-- Code extrahieren und senden
	local lines = vim.api.nvim_buf_get_lines(bufnr, start, end_line, false)
	require("iron.core").send(nil, lines)
end

-- Mapping setzen (z. B. <leader>cc = "cell code")
vim.keymap.set("n", "<leader>icc", send_jupyter_cell, { desc = "Send Jupyter-like cell to REPL" })
