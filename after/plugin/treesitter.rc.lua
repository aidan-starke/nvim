local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

---@diagnostic disable-next-line: unused-local
local function disable_large_files(_lang, buf)
	local max_filesize = 100 * 1024 -- 100 KB
	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	if ok and stats and stats.size > max_filesize then
		return true
	end
end

require 'nvim-treesitter.install'.prefer_git = false

ts.setup {
	ensure_installed = {
		"lua",
		"tsx",
		"javascript",
		"typescript",
		"solidity",
		"svelte",
		"rust",
		"graphql"
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
	},
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "typescript.tsx" }
