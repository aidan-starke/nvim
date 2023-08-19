local ok, harpoon = pcall(require, "harpoon")
if not ok then
	return
end

harpoon.setup({
	excluded_filetypes = { "harpoon", "NvimTree", "TelescopePrompt" },
})

local set_keymaps, nnoremap = require("setup.helpers").set_keymaps, require("setup.keymap").nnoremap

set_keymaps(nnoremap, {
	{ "<leader>hx", "<cmd>lua require('harpoon.mark').add_file()<cr>" },
	{ "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>" },
	{ "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>" },
	{ "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>" },
}, { silent = true })
