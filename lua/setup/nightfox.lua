local M = {}

local Shade = require("nightfox.lib.shade")
local blue = Shade.new("#00a6fb", 0.15, -0.15) -- base, bright, dim
local orange = Shade.new("#ee5622", "#f6aa1c", -0.15)

M.apply_overrides = function(filetype)
	local syntax = {
		preproc = blue, -- import
		builtin0 = orange, -- 'function'
		bracket = orange.dim, -- +punctuation
		number = orange.bright, -- +boolean
		conditional = blue.bright, -- +for
		ident = "white", -- params
		string = "cyan",
	}

	if filetype == "typescript" or filetype == "typescriptreact" or filetype == "rust" then
		syntax.type = orange
	else
		syntax.type = orange.bright
	end

	require("nightfox").override.specs({
		nightfox = {
			syntax = syntax,
		},
	})

	vim.cmd("colorscheme nightfox")
end

return M
