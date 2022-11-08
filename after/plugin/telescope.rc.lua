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

require("setup.helpers").set_keymaps(nmap, {
	{ ';f',
		function()
			builtin.find_files({
				no_ignore = true,
				hidden = true
			})
		end },
	{ ';g', function()
		builtin.live_grep()
	end },
	{ '\\\\', function()
		builtin.buffers()
	end },
	{ ';t', function()
		builtin.help_tags()
	end },
	{ ';;', function()
		builtin.resume()
	end },
	{ ';d', function()
		builtin.diagnostics()
	end },
	{ ';z', function()
		builtin.current_buffer_fuzzy_find()
	end },
	{ ";b", function()
		telescope.extensions.file_browser.file_browser({
			path = "%:p:h",
			cwd = vim.fn.expand('%:p:h'),
			respect_gitignore = false,
			hidden = true,
			grouped = true,
			previewer = false,
			initial_mode = "normal",
			layout_config = { height = 40 }
		})
	end },
	{ ";h", function()
		telescope.extensions.harpoon.marks()
	end },
	{ ';db', function()
		telescope.extensions.dap.list_breakpoints()
	end },
	{ ';dc', function()
		telescope.extensions.dap.commands()
	end },
	{ ';dv', function()
		telescope.extensions.dap.variables()
	end },
	{ ';df', function()
		telescope.extensions.dap.frames()
	end },
	{ ';c', function()
		telescope.load_extension('neoclip').default()
	end }
})
