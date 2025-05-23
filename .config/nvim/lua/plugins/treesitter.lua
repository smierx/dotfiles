return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "python", "go", "gomod", "yaml", "lua", "vim", "vimdoc", "query", "dockerfile" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
