local status, hop = pcall(require, 'hop')
if (not status) then return end

hop.setup { keys = 'abcdefghijklmnopqrstuvwxyz' }

local directions = require('hop.hint').HintDirection
local set_keymaps = require("setup.helpers").set_keymaps

set_keymaps(require("setup.keymap").remap, {
	{ 'f', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, })
	end, },
	{ 'F', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, })
	end, },
	{ 't', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
	end, },
	{ 'T', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = -1 })
	end, }
})
