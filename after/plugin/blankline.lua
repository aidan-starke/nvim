local ok, blankline = pcall(require, "indent_blankline")
if not ok then
	return
end

vim.cmd([[highlight IndentBlanklineIndent guifg=#3b4252 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#f6aa1c gui=nocombine]])

local opts = {
	char = "│",
	buftype_exclude = { "terminal" },
	show_first_blankline_level = false,
	char_highlight_list = {
		"IndentBlanklineIndent",
	},
	show_current_context = true,
}

local is_enabled = true
local merge_tables = require("setup.helpers").merge_tables

local function toggle_blankline()
	local filetype_exclude = {
		"lua",
		"packer",
		"help",
		"NvimTree",
		"gitcommit",
		"markdown",
		"json",
		"text",
		"log",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"rust",
		"mason",
		"lazy",
	}

	if is_enabled then
		is_enabled = false

		filetype_exclude = merge_tables({ vim.bo.filetype }, filetype_exclude)
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

	blankline.setup(opts)
end

toggle_blankline()

require("setup.keymap").nnoremap("<leader>bl", function()
	toggle_blankline()
end, { silent = true })
