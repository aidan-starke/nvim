local ok, harpoon = pcall(require, "harpoon")
if not ok then
	return
end

harpoon.setup({
	excluded_filetypes = { "harpoon", "NvimTree", "TelescopePrompt" },
})

local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

local set_keymaps, nnoremap = require("setup.helpers").set_keymaps, require("setup.keymap").nnoremap

set_keymaps(nnoremap, {
	{ "<leader>hx", function() harpoon:list():add() end },
	{ "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
	{ "<leader>hn", function() harpoon:list():next({ ui_nav_wrap = true }) end },
	{ "<leader>hp", function() harpoon:list():prev() end },
}, { silent = true })
