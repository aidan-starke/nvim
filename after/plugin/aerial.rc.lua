local status, aerial = pcall(require, "aerial")
if (not status) then return end

aerial.setup({
	backends = {
		['_'] = { "lsp", "treesitter" }
	},
	filter_kind = {
		"Class",
		"Constructor",
		"Enum",
		"Function",
		"Interface",
		"Module",
		"Method",
		"Struct",
		"Variable"
	},
})
