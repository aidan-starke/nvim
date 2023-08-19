local status, nightfox = pcall(require, "nightfox")
if not status then
	return
end

local shade = require("nightfox.lib.shade")
local blue, orange = shade.new("#00a6fb", 0.15, -0.15), shade.new("#ee5622", "#f6aa1c", -0.15)

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
				preproc = blue, -- import
				ident = "white", -- params
				string = "cyan",
				builtin0 = orange, -- 'function'
				const = orange.dim,
				builtin1 = "#bde0fe", -- built in types
				type = orange.bright,
				bracket = "orange.dim", -- +punctuation
				number = orange.bright, -- +boolean
				conditional = blue.bright, -- +for
			},
		},
	},
})

vim.cmd([[colorscheme nightfox]])
vim.cmd([[highlight! link NormalFloat Normal]])
