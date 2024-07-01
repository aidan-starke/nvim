local status = pcall(require, "toggleterm")
if (not status) then return end

local Terminal = require('toggleterm.terminal').Terminal

local mapOpts = { noremap = true, silent = true }

local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "rounded",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", mapOpts)
	end,
	-- function to run on closing the terminal
	on_close = function()
		vim.cmd("startinsert!")
	end,
})

require("setup.keymap").nnoremap("<leader>lg", function()
	lazygit:toggle()
end, mapOpts)
