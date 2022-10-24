local status, harpoon = pcall(require, "harpoon")
if (not status) then return end

harpoon.setup({
	-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
	save_on_toggle = false,

	-- saves the harpoon file upon every change. disabling is unrecommended.
	save_on_change = true,

	-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
	enter_on_sendcmd = false,

	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
	tmux_autoclose_windows = false,

	-- filetypes that you want to prevent from adding to the harpoon list menu.
	excluded_filetypes = { "harpoon", "NvimTree", "TelescopePrompt" },

	-- set marks specific to each git branch inside git repository
	mark_branch = false,
})

local mapOpts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>hx", "<cmd>lua require('harpoon.mark').add_file()<cr>", mapOpts)
vim.api.nvim_set_keymap("n", "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", mapOpts)
vim.api.nvim_set_keymap("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", mapOpts)
vim.api.nvim_set_keymap("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", mapOpts)
vim.api.nvim_set_keymap("n", "<leader>ht", "<cmd>Telescope harpoon marks<cr>", mapOpts)
vim.api.nvim_set_keymap("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1) <cr>", mapOpts)
vim.api.nvim_set_keymap("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2) <cr>", mapOpts)
vim.api.nvim_set_keymap("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3) <cr>", mapOpts)
vim.api.nvim_set_keymap("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4) <cr>", mapOpts)
