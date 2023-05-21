local status, harpoon = pcall(require, "harpoon")
if (not status) then return end

harpoon.setup({
	excluded_filetypes = { "harpoon", "NvimTree", "TelescopePrompt" },
})

local nnoremap = require("setup.keymap").nnoremap
require("setup.helpers").set_keymaps(nnoremap, {
	{ "<leader>hx", "<cmd>lua require('harpoon.mark').add_file()<cr>" },
	{ "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>" },
	{ "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>" },
	{ "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>" },
}, { silent = true })
