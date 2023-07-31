local status, hop = pcall(require, 'hop')
if (not status) then return end

hop.setup()

local directions = require('hop.hint').HintDirection
local set_keymaps = require("setup.helpers").set_keymaps

set_keymaps(require("setup.keymap").remap, {
	{ '<leader>f', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, })
	end, },
	{ '<leader>F', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, })
	end, },
	{ '<leader>t', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
	end, },
	{ '<leader>T', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = -1 })
	end, }
})
