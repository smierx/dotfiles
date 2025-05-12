return {
	"rmagatti/goto-preview",
	dependencies = { "rmagatti/logger.nvim" },
	event = "BufEnter",
	config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
	keys = {
		{ "<leader>gd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", desc = "Preview Definition" },
		{
			"<leader>gt",
			"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
			desc = "Preview Type Definition",
		},
		{
			"<leader>gi",
			"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
			desc = "Preview Implementation",
		},
		{
			"<leader>gD",
			"<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
			desc = "Preview Declaration",
		},
		{ "<leader>gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", desc = "Close all Preview" },
		{ "<leader>gR", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", desc = "Preview References" },
	},
}
