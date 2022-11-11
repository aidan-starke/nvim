local status, telescope = pcall(require, "telescope")
if (not status) then return end

telescope.setup {
	defaults = {
		mappings = {
			n = {
				["q"] = require('telescope.actions').close
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		}
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	},
}

telescope.load_extension("dap")
telescope.load_extension("fzf")

local nmap = require("setup.keymap").nmap
local builtin = require("telescope.builtin")
local ivy_theme = require("telescope.themes").get_ivy()
local merge_tables = require("setup.helpers").merge_tables

require("setup.helpers").set_keymaps(nmap, {
	{ ';f',
		function()
			builtin.find_files(merge_tables({
				hidden = true
			}, ivy_theme))
		end },
	{ ';g', function()
		builtin.live_grep(ivy_theme)
	end },
	{ '\\\\', function()
		builtin.buffers(ivy_theme)
	end },
	{ ';t', function()
		builtin.help_tags(ivy_theme)
	end },
	{ ';;', function()
		builtin.resume(ivy_theme)
	end },
	{ ';d', function()
		builtin.diagnostics(ivy_theme)
	end },
	{ ';z', function()
		builtin.current_buffer_fuzzy_find(ivy_theme)
	end },
	{ ";b", function()
		telescope.extensions.file_browser.file_browser(merge_tables({
			path = "%:p:h",
			cwd = vim.fn.expand('%:p:h'),
			respect_gitignore = false,
			hidden = true,
			grouped = true,
			previewer = false,
			initial_mode = "normal",
			layout_config = { height = 40 }
		}, ivy_theme))
	end },
	{ ";h", function()
		telescope.extensions.harpoon.marks(ivy_theme)
	end },
	{ ';db', function()
		telescope.extensions.dap.list_breakpoints(ivy_theme)
	end },
	{ ';dc', function()
		telescope.extensions.dap.commands(ivy_theme)
	end },
	{ ';dv', function()
		telescope.extensions.dap.variables(ivy_theme)
	end },
	{ ';df', function()
		telescope.extensions.dap.frames(ivy_theme)
	end },
	{ ';c', function()
		telescope.load_extension('neoclip').default(ivy_theme)
	end }
})
