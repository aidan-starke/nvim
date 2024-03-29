local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local has_dprint_config = function()
	---@diagnostic disable-next-line: redefined-local
	local ok, _ = pcall(vim.fn.readfile, vim.fn.getcwd() .. "/dprint.json")
	return ok
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint_d.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),
		has_dprint_config() and formatting.dprint or formatting.prettierd,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
