local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local ok, neodev = pcall(require, "neodev")
if (ok) then
	neodev.setup()
end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
---@diagnostic disable-next-line: unused-local
local on_attach = function(_client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, 'n', ...) end

	require("setup.helpers").set_keymaps(buf_set_keymap,
		{
			{ 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>' },
			{ 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>' },
			{ 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>' },
			{ 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>' },
			{ 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>' },
			{ 'gtd',        '<cmd>lua vim.lsp.buf.type_definition()<CR>' },
			{ '<leader>li', '<cmd>LspInfo<CR>' },
			{ '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>' },
			{ '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>' },
		}, { noremap = true, silent = true })

	-- Diagnostic hover
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float(nil, {
				focusable = true,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			})
		end
	})

	-- Signature
	require("lsp_signature").on_attach({
		bind = true,
		hint_enable = true,
		toggle_key = "<C-f>",
		hint_prefix = "🤔  ",
		hint_scheme = "String",
		floating_window = false,
		handler_opts = {
			border = "rounded",
		}
	}, bufnr)
end

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, prefix = "●" },
			severity_sort = true,
		})
}
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	"flow",
	"tailwindcss",
	"lua_ls",
	"tsserver",
	"solidity",
	"rust_analyzer",
	"prismals",
	"yamlls"
}

local opts = {}
local merge_tables = require("setup.helpers").merge_tables

for _, lsp in ipairs(servers) do
	opts = {
		handlers = handlers,
		on_attach = on_attach,
		capabilities = capabilities,
	}
	local merge_opts = function(m_opts)
		return merge_tables(opts, m_opts)
	end

	if lsp == "lua_ls" then
		opts = merge_opts({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false
					},
				},
			},
		})
	end

	if lsp == "tailwindcss" then
		opts = merge_opts({
			filetypes = { "javascriptreact", "typescriptreact", "svelte" }
		})
	end

	if lsp == "solidity" then
		opts = merge_opts({
			cmd = { "solidity-ls", "--stdio" },
		})
	end

	if lsp == "rust_analyzer" then
		require("setup.rust").set_rust_keymaps()

		require("rust-tools").setup {
			tools = {
				on_initialized = function()
					vim.cmd [[autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()]]
				end,
			},
			server = merge_opts({
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					enable_format_on_save(client, bufnr)
				end,
				settings = {
					["rust-analyzer"] = {
						lens = {
							enable = true,
						},
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			}),
		}

		goto continue
	end

	if lsp == "prismals" then
		opts = merge_opts({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
		})
	end

	nvim_lsp[lsp].setup(opts)

	::continue::
end


-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●"
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
