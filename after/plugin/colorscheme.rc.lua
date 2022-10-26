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

nightfox.override.specs({
	nightfox = {
		syntax = {
			type = "#f6aa1c",
			string = "cyan"
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
