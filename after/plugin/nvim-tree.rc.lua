local status, tree = pcall(require, "nvim-tree")
if (not status) then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
	sort_by = "case_sensitive",
	hijack_cursor = true,
	renderer = {
		group_empty = true,
		icons = {
			show = {
				folder = false,
				file = false,
			}
		}
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	update_focused_file = {
		enable = true,
	},
	git = {
		ignore = false,
	},
})
