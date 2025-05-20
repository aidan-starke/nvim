local ok, lint = pcall(require, "lint")
if not ok then
	return
end

lint.linters_by_ft = {
	lua = { "luac" },
	["_"] = { "eslint_d" }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
