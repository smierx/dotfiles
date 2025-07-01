return {
	"lervag/wiki.vim",
	-- tag = "v0.10", -- uncomment to pin to a specific release
	init = function()
		-- Setze deinen Wiki-Root
		vim.g.wiki_root = "~/.study"

		-- Optional: Dateiendung festlegen, z.B. Markdown
		vim.g.wiki_filetypes = { "md" }
		vim.g.wiki_ext = ".md"

		-- Optional: Syntax-Highlighting
		vim.g.wiki_link_extension = ".md"
		vim.g.wiki_link_target_type = "wiki"

		-- Optional: Default-Index-Datei
		vim.g.wiki_index_name = "index"

		-- Neuer Befehl: WikiCreateLink
		vim.api.nvim_create_user_command("WikiCreateLink", function()
			vim.ui.input({ prompt = "Neuer Wiki-Name: " }, function(input)
				if input == nil or input == "" then
					vim.notify("Abgebrochen.", vim.log.levels.INFO)
					return
				end

				-- Erzeuge Dateipfad
				local wiki_root = vim.fn.expand(vim.g.wiki_root)
				local file_path = wiki_root .. "/" .. input .. vim.g.wiki_ext

				-- Datei anlegen, falls sie noch nicht existiert
				if vim.fn.filereadable(file_path) == 0 then
					vim.fn.writefile({}, file_path)
					vim.notify("Wiki-Datei erstellt: " .. file_path, vim.log.levels.INFO)
				else
					vim.notify("Wiki-Datei existiert bereits: " .. file_path, vim.log.levels.WARN)
				end

				-- Link an Cursor-Position einfügen
				local link_text = string.format("[%s.md](%s.md)", input, input)
				vim.api.nvim_put({ link_text }, "c", true, true)
			end)
		end, { desc = "Neue Wiki-Seite anlegen und verlinken" })

		-- Optional: Shortcut
		vim.keymap.set("n", "<leader>wc", ":WikiCreateLink<CR>", { desc = "Neue Wiki-Seite anlegen und verlinken" })
	end,
}
