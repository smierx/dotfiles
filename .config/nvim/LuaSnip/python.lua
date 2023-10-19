local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s("im", { t("import ") }),
	s("fim", { t("from "), i(1, "package/module"), t(" import "), i(2, "Names") }),
	s("classi", {
		t("class "),
		i(1, "ClassName"),
		t("("),
		i(2, "object"),
		t({ "):", "\tdef __init__(self):", "\t\tsuper.__init__()" }),
	}),
}
