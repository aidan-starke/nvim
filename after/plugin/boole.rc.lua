local status, boole = pcall(require, "boole")
if (not status) then return end

boole.setup({
	mappings = {
		increment = '<C-a>',
		decrement = '<C-x>'
	},
})
