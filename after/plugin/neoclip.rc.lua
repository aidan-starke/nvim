local status, neoclip = pcall(require, "neoclip")
if (not status) then return end

local function is_whitespace(line)
	return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
	for _, entry in ipairs(tbl) do
		if not check(entry) then
			return false
		end
	end
	return true
end

neoclip.setup({
	history = 10,
	filter = function(data)
		return not all(data.event.regcontents, is_whitespace)
	end, -- Dont save blank lines to register
})
