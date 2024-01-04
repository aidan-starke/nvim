local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

---@diagnostic disable-next-line: unused-local
local function disable_large_files(_lang, buf)
	local max_filesize = 100 * 1024 -- 100 KB
	local stat_ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	if stat_ok and stats and stats.size > max_filesize then
		return true
	end
end

---@diagnostic disable-next-line: missing-fields
treesitter.setup({
	ensure_installed = {
		"lua",
		"tsx",
		"javascript",
		"typescript",
		"solidity",
		"svelte",
		"rust",
		"graphql",
		"python",
	},
	highlight = {
		enable = true,
		disable = disable_large_files,
	},
	indent = {
		enable = true,
		disable = disable_large_files,
	},
	autotag = {
		enable = true,
		enable_close_on_slash = false,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "typescript.tsx" }
