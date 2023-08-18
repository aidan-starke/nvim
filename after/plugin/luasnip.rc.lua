---@diagnostic disable: missing-parameter
local status, luasnip = pcall(require, 'luasnip')
if (not status) then return end

local types = require('luasnip.util.types')
local parse = require('luasnip.util.parser').parse_snippet

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({
	history = true,
	updateevents = 'TextChanged,TextChangedI',
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	}
})

local bind = require("setup.keymap").bind
local set_keymaps = require("setup.helpers").set_keymaps

set_keymaps(bind({ "i", "s" }), {
	{ "<C-k>", function()
		if luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		end
	end },
	{ "<C-j>", function()
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		end
	end },
	{ "<C-l>", function()
		if luasnip.choice_active() then
			luasnip.change_choice(1)
		end
	end }
}, { silent = true })
