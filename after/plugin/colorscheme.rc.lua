local status, nightfox = pcall(require, "nightfox")
if (not status) then return end

nightfox.setup({
	options = {
		transparent = true,
		styles = {
			comments = "italic",
			types = "italic",
		}
	},
})

local Shade = require("nightfox.lib.shade")
local blue = Shade.new("#00a6fb", 0.15, -0.15) -- base, bright, dim
local orange = Shade.new("#ee5622", "#f6aa1c", -0.15)

nightfox.override.specs({
	nightfox = {
		syntax = {
			preproc = blue, -- import
			builtin0 = orange, -- 'function'
			const = orange.dim,
			bracket = "orange.dim", -- +punctuation
			number = orange.bright, -- +boolean
			conditional = blue.bright, -- +for
			ident = "white", -- params
			string = "cyan",
			type = orange.bright,
		},
	},
})

vim.cmd [[colorscheme nightfox]]

local isTransparent = true

function Toggle_transparent_background()
	if isTransparent then
		nightfox.setup({
			options = {
				transparent = false
			}
		})
		isTransparent = false
	else
		nightfox.setup({
			options = {
				transparent = true
			}
		})
		isTransparent = true
	end
	vim.cmd("colorscheme nightfox")
end

require("setup.keymap").nnoremap('<leader>ct', '<cmd>lua Toggle_transparent_background()<CR>', { silent = true })
