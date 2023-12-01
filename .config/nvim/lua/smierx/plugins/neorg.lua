return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-cmp",
		},
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = { config = { engine = "nvim-cmp", name = "[Norg]" } }, -- Adds pretty icons to your documents
					["core.integrations.nvim-cmp"] = {},
					["core.export"] = {},
					["core.keybinds"] = {
						config = {
							default_keybinds = true,
							neorg_leader = "<Leader><Leader>",
						},
					},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								ws = "~/.notes",
							},
						},
					},
				},
			})
			local keymap = vim.keymap
			keymap.set("n", "<leader>ow", "<cmd>:Neorg workspace ws<cr>", { desc = "Workspaces" })
		end,
	},
}
