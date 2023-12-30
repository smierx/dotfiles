return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				latex = { "latexindent" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})
	end,
}
