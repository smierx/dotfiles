-- ~/.config/nvim/LuaSnip/markdown.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- definition
  s("def", {
    t({"```definition"}), i(1, "Begriff"), t({"","```",""}),
  }),

  -- proof block
  s("pf", {
    t({"```proof",""}), i(1, "Beweis..."), t({"","```"}),
  }),

  -- display math
  s("dm", {
    t({"$$",""}), i(1, "expression"), t({"","$$"}), i(0)
  }),

  -- inline math
  s("im", {
    t({"$"}), i(1, "x"), t({"$"}), i(0)
  }),

  -- aligned equations
  s("align", { t({ "$$", "\\begin{aligned}","" }), i(1, "a &= b \\\\ c &= d"), t({ "", "\\end{aligned}", "$$" }) }),

  -- equation environment (LaTeX)
  s("eq", {
    t({"$$","\\begin{equation}",""}),
    i(1, "E = mc^2"),
    t({"","\\end{equation}","$$"})
  }),

  -- example
  s("ex", {
    t({"```example ",""}), i(1, "konkretes Beispiel"), t({"","```"})
  }),
}


