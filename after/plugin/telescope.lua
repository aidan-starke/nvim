local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local togglescope_keybinding = "<C-^>"

telescope.setup({
	defaults = {
		file_ignore_patterns = { "^.git/", "node_modules", "^.yarn/", "^.next/" },
		mappings = {
			n = {
				["q"] = require("telescope.actions").close,
			},
		},
	},
	extensions = {
		togglescope = {
			find_files = {
				[togglescope_keybinding] = {
					no_ignore = true,
					togglescope_title = "Find Files (hidden)",
				},
			},
			live_grep = {
				[togglescope_keybinding] = {
					additional_args = { "--hidden", "--no-ignore" },
					togglescope_title = "Live Grep (hidden)",
				},
			},
		},
	},
})

telescope.load_extension("dap")
telescope.load_extension("fzf")

local togglescope = telescope.extensions.togglescope
local builtin, ivy_theme = require("telescope.builtin"), require("telescope.themes").get_ivy()

local helpers = require("setup.helpers")
local merge_tables, nnoremap, set_keymaps = helpers.merge_tables, require("setup.keymap").nnoremap, helpers.set_keymaps

local normal_mode = merge_tables({
	sort_lastused = true,
	initial_mode = "normal",
}, ivy_theme)

set_keymaps(nnoremap, {
	{
		";f",
		function()
			togglescope.find_files(merge_tables({
				find_command = { "rg", "--files", "--hidden" },
			}, ivy_theme))
		end,
	},
	{
		";g",
		function()
			togglescope.live_grep(ivy_theme)
		end,
	},
	{
		";z",
		function()
			builtin.current_buffer_fuzzy_find(ivy_theme)
		end,
	},
	{
		"\\\\",
		function()
			builtin.buffers(merge_tables({
				sort_lastused = true,
			}, normal_mode))
		end,
	},
	{
		";t",
		function()
			builtin.help_tags(ivy_theme)
		end,
	},
	{
		";;",
		function()
			builtin.resume(normal_mode)
		end,
	},
	{
		";d",
		function()
			builtin.diagnostics(ivy_theme)
		end,
	},
	{
		";b",
		function()
			telescope.extensions.file_browser.file_browser(merge_tables({
				path = "%:p:h",
				cwd = vim.fn.expand("%:p:h"),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				layout_config = { height = 40 },
			}, normal_mode))
		end,
	},
	{
		";db",
		function()
			telescope.extensions.dap.list_breakpoints(normal_mode)
		end,
	},
	{
		";dc",
		function()
			telescope.extensions.dap.commands(normal_mode)
		end,
	},
	{
		";dv",
		function()
			telescope.extensions.dap.variables(normal_mode)
		end,
	},
	{
		";df",
		function()
			telescope.extensions.dap.frames(normal_mode)
		end,
	},
	{
		";h",
		function()
			telescope.extensions.harpoon.marks(normal_mode)
		end,
	},
})
