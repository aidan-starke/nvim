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

local function apply_overrides()
	local orange = "#f6aa1c"
	local purple = "#0000ff"
	local bracket = "#98f5e1"
	local filetype = vim.bo.filetype

	if (filetype == "typescript" or filetype == "typescriptreact")
	then
		nightfox.override.specs({
			nightfox = {
				syntax = {
					type = orange,
					bracket = bracket,
					string = "cyan",
				}
			}
		})
	else
		nightfox.override.specs({
			nightfox = {
				syntax = {
					type = orange,
					number = orange,
					preproc = purple,
					bracket = bracket,
					conditional = purple,
					ident = "pink",
					string = "cyan",
					builtin0 = "magenta", -- 'function'
				}
			}
		})
	end

	vim.cmd("colorscheme nightfox")
end

apply_overrides()

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

local mapOpts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>ct', '<cmd>lua Toggle_transparent_background()<CR>', mapOpts)
