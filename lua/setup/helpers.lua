local M = {}

M.merge_tables = function(...)
	return vim.tbl_extend("force", ...)
end

M.set_keymaps = function(set_keymap, pairs, opts)
	for _, pair in ipairs(pairs) do
		---@diagnostic disable-next-line: deprecated
		local key, map = unpack(pair)

		set_keymap(key, map, opts)
	end
end

return M
