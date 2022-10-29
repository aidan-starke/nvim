local status, nightfox = pcall(require, "nightfox")
if (not status) then return end

nightfox.setup({
	options = {
		transparent = true,
	},
})

require("setup.nightfox").apply_overrides()

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
