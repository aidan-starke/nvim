local status, nightfox = pcall(require, "nightfox")
if (not status) then return end

nightfox.setup({
	options = {
		transparent = true,
		styles = {
			comments = "italic",
			keywords = "bold",
			-- types = "italic,bold",
		}

	},
})

-- Javascript theme overrides
local orange = "#f6aa1c"
local purple = "#0000ff"
nightfox.override.specs({
	nightfox = {
		syntax = {
			type = orange,
			number = orange,
			preproc = purple,
			conditional = purple,
			string = "cyan",
			bracket = "#98f5e1",
			builtin0 = "magenta", -- 'function'
			ident = "pink"
		}
	}
})

vim.cmd("colorscheme nightfox")

local isTransparent = true

function toggle_transparent_background()
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

vim.api.nvim_set_keymap('n', '<leader>ct', '<cmd>lua toggle_transparent_background()<CR>',
	{ noremap = true, silent = true })
