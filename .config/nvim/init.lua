require("smierx.core")
require("smierx.lazy")

require("luasnip").config.set_config({ -- Setting LuaSnip config
	-- Enable autotriggered snippets
	enable_autosnippets = true,
	-- Use Tab (or some other key if you prefer) to trigger visual selection
	store_selection_keys = "<Tab>",
})
require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })
