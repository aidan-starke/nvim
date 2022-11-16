local status, tree = pcall(require, "nvim-tree")
if (not status) then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
	sort_by = "case_sensitive",
	hijack_cursor = true,
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
		icons = {
			show = {
				folder = false,
				file = false,
			}
		}
	},
	update_focused_file = {
		enable = true,
	},
	git = {
		ignore = false,
	},
})
