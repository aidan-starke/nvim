local ok, noice = pcall(require, "noice")
if not ok then
	return
end

local disable = {
	enabled = false,
}

noice.setup({
	lsp = {
		progress = disable,
		signature = disable,
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
})
