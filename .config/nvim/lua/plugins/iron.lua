return {
	"Vigemus/iron.nvim",
	config = function()
		local iron = require("iron.core")

		iron.setup({
			config = {
				-- Whether a repl should be discarded or not
				scratch_repl = true,
				-- Your repl definitions come here
				repl_definition = {
					sh = {
						-- Can be a table or a function that
						-- returns a table (see below)
						command = { "bash" },
					},
				},
				-- How the repl window will be displayed
				-- See below for more information
				repl_open_cmd = "vertical botright 80 split",
			},
			-- Iron doesn't set keymaps by default anymore.
			-- You can set them here or manually add keymaps to the functions in iron.core
			keymaps = {
				send_motion = "<space>ism",
				visual_send = "<space>isc",
				send_file = "<space>if",
				send_line = "<space>il",
				send_mark = "<space>isa",
				mark_motion = "<space>im",
				mark_visual = "<space>iv",
				remove_mark = "<space>sd",
				cr = "<space>i<cr>",
				interrupt = "<space>i<space>",
				exit = "<space>iq",
				clear = "<space>icl",
			},
			-- If the highlight is on, you can change how it looks
			-- For the available options, check nvim_set_hl
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
		})

		-- iron also has a list of commands, see :h iron-commands for all available commands
		vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>")
		vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>")
		vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
		vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
	end,
}
