local ok, ls = pcall(require, "luasnip")
if not ok then
	return
end

local s, i, t, c, f = ls.snippet, ls.insert_node, ls.text_node, ls.choice_node, ls.function_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("lua", {
	s("yeet", fmt([[print('yeet', {})]], { i(1, "yeet") })),
	s(
		"req",
		fmt([[local {} = require("{}")]], {
			f(function(import_name)
				local parts = vim.split(import_name[1][1], ".", { plain = true })
				return parts[#parts]
			end, { 1 }),
			i(1),
		})
	),
})

ls.add_snippets("rust", {
	s("yeet", fmt([[println!("yeet {{}}", {});]], { i(1, "yeet") })),
	s(
		"modtest",
		fmt(
			[[
         #[cfg(test)]
			mod test {{
				{}

			      {}
			}}
			]],
			{
				c(1, { t("use super::*;"), t("") }),
				i(0),
			}
		)
	),
})

ls.add_snippets("typescript", {
	s("type", fmt([[type {} = {};]], { i(1, "Name"), i(0) })),
	s("yeet", fmt([[console.log("yeet", {});]], { i(1, "yeet") })),
	s(
		"interface",
		fmt(
			[[
			interface {} {{
				{}
			}}
			]],
			{ i(1, "Name"), i(0) }
		)
	),
	s(
		"fn",
		fmt(
			[[
			function {} ({}){} {{
				{}
			}}
			]],
			{
				i(1, "name"),
				i(2),
				c(3, {
					t(""),
					t(": any"),
				}),
				i(0),
			}
		)
	),
	s(
		"const",
		fmt(
			[[
			const {} = ({}){} => {{
				{}
			}};
			]],
			{
				i(1, "name"),
				i(2),
				c(3, {
					t(""),
					t(": any"),
				}),
				i(0),
			}
		)
	),
})
