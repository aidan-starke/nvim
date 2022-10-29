local status, indent = pcall(require, 'indent_blankline')
if (not status) then return end

vim.cmd [[highlight IndentBlanklineIndent guifg=#3b4252 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#f6aa1c gui=nocombine]]

local is_enabled = false
local merge_tables = require("setup.helpers").merge_tables

Toggle_indent = function()
	local filetype_exclude = {
		'lua',
		'packer',
		'help',
		'NvimTree',
		'gitcommit',
		'markdown',
		'json',
		'text',
		'log',
		'typescript'
	}
	local opts = {
		char = '│',
		buftype_exclude = { 'terminal' },
		show_first_indent_level = false,
		char_highlight_list = {
			"IndentBlanklineIndent",
		},
		show_current_context = true,
	}
	if is_enabled then
		is_enabled = false

		filetype_exclude = merge_tables(filetype_exclude, { vim.bo.filetype })
		opts = merge_tables(opts, {
			filetype_exclude = filetype_exclude,
		})
	else
		is_enabled = true

		filetype_exclude = vim.tbl_filter(function(v)
			return v ~= vim.bo.filetype
		end, filetype_exclude)
		opts = merge_tables(opts, {
			filetype_exclude = filetype_exclude,
		})
	end

	indent.setup(opts)
end

Toggle_indent()

require("setup.keymap").nnoremap('<leader>ti', '<cmd>lua Toggle_indent()<CR>', { silent = true })
