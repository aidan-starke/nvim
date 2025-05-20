local ok, nightfox = pcall(require, "nightfox")
if not ok then
	return
end

local shade = require("nightfox.lib.shade")
local blue, orange = shade.new("#00a6fb", 0.15, -0.065), shade.new("#ee5622", "#f6aa1c", -0.15)

nightfox.setup({
	options = {
		transparent = true,
		styles = {
			comments = "italic",
			types = "bold,italic",
			conditionals = "italic",
		},
	},
	specs = {
		nightfox = {
			syntax = {
				bracket = "orange.dim", -- +punctuation
				builtin0 = orange.base, -- 'function'
				builtin1 = "#bde0fe", -- built in types
				--     builtin2 = "#f6b079",
				builtin3 = orange.bright, -- interface names
				--     comment = "#738091",
				conditional = blue.bright, -- +for
				const = orange.dim,
				--     dep = "#71839b",
				--     field = "#719cd6",
				--     func = "#86abdc",
				ident = "white", -- params
				--     keyword = "#9d79d6",
				number = orange.bright, -- +boolean
				--     operator = "#aeafb0",
				preproc = blue.dim, -- import
				--     regex = "#e0c989",
				--     statement = "#9d79d6",
				string = "cyan",
				type = orange.bright,
				--     variable = "#dfdfe0"
			},
		},
	},
	groups = {
		nightfox = {
			["@parameter"] = {
				fg = "#dfdfe0"
			},
			["exception"] = {
				fg = orange.base
			},
			["Constant"] = {
				fg = orange.dim
			},
			-- ["@punctuation.special"] = {
			-- 	fg = blue.bright
			-- }
		}
	}
})

vim.cmd([[colorscheme nightfox]])
vim.cmd([[highlight! link NormalFloat Normal]])
