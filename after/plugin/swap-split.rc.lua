local status, swap = pcall(require, 'swap-split')
if (not status) then return end

swap.setup({
	ignore_filetypes = {
		"NvimTree"
	}
})

require("setup.keymap").nnoremap("<leader>S", "<cmd>lua require('swap-split').swap()<CR>")

vim.cmd [[hi SwapSplitStatusLine guifg=#ffffff guibg=#00a6fb]]
