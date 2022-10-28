local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local nmap = require("setup.keymap").nmap

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.load_extension('harpoon')

telescope.setup {
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function() vim.cmd('normal vbd') end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd('startinsert')
					end
				},
			},
		},
	},
}

nmap(';f',
	function()
		builtin.find_files({
			no_ignore = false,
			hidden = true
		})
	end)
nmap(';g', function()
	builtin.live_grep()
end)
nmap('\\\\', function()
	builtin.buffers()
end)
nmap(';t', function()
	builtin.help_tags()
end)
nmap(';;', function()
	builtin.resume()
end)
nmap(';e', function()
	builtin.diagnostics()
end)
nmap(";b", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 }
	})
end)
