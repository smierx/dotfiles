local setup, comments = pcall(require,"todo-comments")
local keymap = vim.keymap


keymap.set("n","<leader>ftt","<cmd>TodoTelescope keywords=TODO,URL<cr>")
keymap.set("n","<leader>ftf","<cmd>TodoTelescope keywords=FIX,URL<cr>")
keymap.set("n","<leader>ftw","<cmd>TodoTelescope keywords=WARN,URL<cr>")
keymap.set("n","<leader>ftn","<cmd>TodoTelescope keywords=NOTE,URL<cr>")
comments.setup()
