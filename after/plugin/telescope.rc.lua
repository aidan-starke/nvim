local status, telescope = pcall(require, "telescope")
if (not status) then return end

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = require('telescope.actions').close
			},
		},
	},
})

-- telescope.load_extension("dap")
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
local nnoremap = require("setup.keymap").nnoremap
local ivy_theme = require("telescope.themes").get_ivy()
local merge_tables = require("setup.helpers").merge_tables

local normal_mode = merge_tables({
	sort_lastused = true,
	initial_mode = "normal",
}, ivy_theme)

require("setup.helpers").set_keymaps(nnoremap, {
	{ ';f', function()
		builtin.find_files(merge_tables({
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		}, ivy_theme))
	end },
	{ ';g', function()
		builtin.live_grep(ivy_theme)
	end },
	{ ';z', function()
		builtin.current_buffer_fuzzy_find(ivy_theme)
	end },
	{ '\\\\', function()
		builtin.buffers(merge_tables({
			sort_lastused = true,
		}, normal_mode))
	end },
	{ ';t', function()
		builtin.help_tags(ivy_theme)
	end },
	{ ';;', function()
		builtin.resume(normal_mode)
	end },
	{ ';d', function()
		builtin.diagnostics(ivy_theme)
	end },
	{ ";b", function()
		telescope.extensions.file_browser.file_browser(merge_tables({
			path = "%:p:h",
			cwd = vim.fn.expand('%:p:h'),
			respect_gitignore = false,
			hidden = true,
			grouped = true,
			previewer = false,
			layout_config = { height = 40 }
		}, normal_mode))
	end },
	{ ";h", function()
		telescope.extensions.harpoon.marks(normal_mode)
	end },
})
