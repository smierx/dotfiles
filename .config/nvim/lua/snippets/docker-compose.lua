local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- ∀∃□¬∨∧∑λ∈∅

local function get_date()
	return os.date("%m-%d-%Y")
end

return {
	s("local", {
		t("test1"),
		t("test2"),
		i(1, "Was macht ein i?"),
	}),
}
