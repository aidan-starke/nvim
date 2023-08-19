local status, hop = pcall(require, "hop")
if not status then
	return
end

hop.setup()

local hint, directions = hop.hint_char1, require("hop.hint").HintDirection
local set_keymaps, remap = require("setup.helpers").set_keymaps, require("setup.keymap").remap

set_keymaps(remap, {
	{
		"<leader>f",
		function()
			hint({ direction = directions.AFTER_CURSOR })
		end,
	},
	{
		"<leader>F",
		function()
			hint({ direction = directions.BEFORE_CURSOR })
		end,
	},
	{
		"<leader>t",
		function()
			hint({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
		end,
	},
	{
		"<leader>T",
		function()
			hint({ direction = directions.BEFORE_CURSOR, hint_offset = -1 })
		end,
	},
})
