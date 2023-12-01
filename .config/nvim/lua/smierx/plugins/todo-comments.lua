return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		require("todo-comments").setup({})
		local keymap = vim.keymap
		keymap.set("n", "<leader>g]", "<cmd>lua require('todo-comments').jump_next()<cr>")
		keymap.set("n", "<leader>g[", "<cmd>lua require('todo-comments').jump_prev()<cr>")
		keymap.set(
			"n",
			"<leader>ge",
			"<cmd>lua require('todo-comments').jump_next({keywords = {'ERROR','WARNING'}})",
			{ desc = "Next Error/Warning!" }
		)
		keymap.set("n", "<leader>fg", "<cmd>TodoTelescope<cr>")
	end,
}
