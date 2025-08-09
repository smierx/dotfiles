-- ~/.config/nvim/LuaSnip/markdown.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- INLINE MATH
	s("mk", fmt([[\({}\)]], { i(1, "x^2 + y^2 = z^2") })),

	-- BLOCK MATH
	s(
		"mb",
		fmt(
			[[
  $$
  {}
  $$
  ]],
			{ i(1, "E = mc^2") }
		)
	),

	-- SUMME
	s(
		"sum",
		fmt([[\sum_{{{}}}^{{{}}} {}]], {
			i(1, "i=1"),
			i(2, "n"),
			i(3, "a_i"),
		})
	),

	-- PRODUKT
	s(
		"prod",
		fmt([[\prod_{{{}}}^{{{}}} {}]], {
			i(1, "i=1"),
			i(2, "n"),
			i(3, "a_i"),
		})
	),

	-- INTEGRAL
	s(
		"int",
		fmt([[\int_{{{}}}^{{{}}} {} \, d{}]], {
			i(1, "a"),
			i(2, "b"),
			i(3, "f(x)"),
			i(4, "x"),
		})
	),

	-- BRUCH
	s(
		"frac",
		fmt([[\frac{{{}}}{{{}}}]], {
			i(1, "Zähler"),
			i(2, "Nenner"),
		})
	),

	-- ALIGN UMGEBUNG
	s(
		"align",
		fmt(
			[[
  \begin{{align*}}
      {}
  \end{{align*}}
  ]],
			{ i(1, "a &= b + c \\\\ \n    d &= e - f") }
		)
	),

	-- CASES
	s(
		"cases",
		fmt(
			[[
  \begin{{cases}}
      {}
  \end{{cases}}
  ]],
			{ i(1, "x &> 0 \\\\ \n0 &\text{ sonst}") }
		)
	),

	-- 2x2 MATRIX
	s(
		"mat2",
		fmt(
			[[
  \begin{{bmatrix}}
      {} & {} \\\\
      {} & {}
  \end{{bmatrix}}
  ]],
			{ i(1, "a"), i(2, "b"), i(3, "c"), i(4, "d") }
		)
	),

	-- 3x3 MATRIX
	s(
		"mat3",
		fmt(
			[[
  \begin{{bmatrix}}
      {} & {} & {} \\\\
      {} & {} & {} \\\\
      {} & {} & {}
  \end{{bmatrix}}
  ]],
			{
				i(1, "a_{11}"),
				i(2, "a_{12}"),
				i(3, "a_{13}"),
				i(4, "a_{21}"),
				i(5, "a_{22}"),
				i(6, "a_{23}"),
				i(7, "a_{31}"),
				i(8, "a_{32}"),
				i(9, "a_{33}"),
			}
		)
	),

	-- BELIEBIGE MATRIX m x n
	s(
		"mat",
		fmt(
			[[
  \begin{{bmatrix}}
      {}
  \end{{bmatrix}}
  ]],
			{ i(1, "a_{11} & a_{12} & dots \\\\ \n a_{21} & a_{22} & dots") }
		)
	),

	-- GRIECHISCHE BUCHSTABEN
	s("alpha", t("\\alpha")),
	s("beta", t("\\beta")),
	s("gamma", t("\\gamma")),
	s("delta", t("\\delta")),
	s("epsilon", t("\\epsilon")),
	s("lambda", t("\\lambda")),
	s("mu", t("\\mu")),
	s("pi", t("\\pi")),
	s("sigma", t("\\sigma")),
	s("phi", t("\\phi")),
	s("omega", t("\\omega")),

	-- DIFFERENTIALGLEICHUNG
	s(
		"diff",
		fmt([[\frac{{d{}}}{{d{}}}]], {
			i(1, "y"),
			i(2, "x"),
		})
	),

	-- PARTIELLE ABLEITUNG
	s(
		"pdiff",
		fmt([[\frac{{\partial {}}}{{\partial {}}}]], {
			i(1, "f"),
			i(2, "x"),
		})
	),

	-- VEKTOR
	s("vec", fmt([[\vec{{{}}}]], { i(1, "v") })),

	-- HAT SYMBOL (Einheitsvektor)
	s("hat", fmt([[\hat{{{}}}]], { i(1, "v") })),

	-- NORM
	s("norm", fmt([[\lVert {} \rVert]], { i(1, "v") })),
}
