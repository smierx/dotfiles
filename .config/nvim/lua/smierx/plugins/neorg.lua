return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-cmp",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = { config = { icon_preset = "diamond" } }, -- Adds pretty icons to your documents
					["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
					["core.integrations.nvim-cmp"] = {},
					["core.export"] = {},
					["core.keybinds"] = {
						-- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
						config = {
							default_keybinds = true,
							neorg_leader = "<leader><leader>",
							hook = function(keybinds)
								keybinds.unmap("all", "n", "<c-s>")
							end,
						},
					},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								study = "~/study_notes",
								project = "~/project_notes",
								gtd = "~/gtd",
							},
						},
					},
					["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
					["core.qol.toc"] = {},
					["core.qol.todo_items"] = {},
					["core.looking-glass"] = {},
					["core.presenter"] = { config = { zen_mode = "zen-mode" } },
				},
			})
		end,
	},
}
