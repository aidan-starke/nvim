local status, boole = pcall(require, "boole")
if (not status) then return end

boole.setup({
	mappings = {
		increment = '<leader>bk',
		decrement = '<leader>bj',
	},
})
