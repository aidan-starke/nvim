local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

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
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	-- Diagnostics
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
	buf_set_keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	buf_set_keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
	buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	buf_set_keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	buf_set_keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	buf_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	buf_set_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

	-- Aerial window
	buf_set_keymap('n', '<leader>;a', '<cmd>AerialToggle!<CR>', opts)
	-- Jump forwards/backwards with '{' and '}'
	buf_set_keymap('n', '{', '<cmd>AerialPrev<CR>', opts)
	buf_set_keymap('n', '}', '<cmd>AerialNext<CR>', opts)
	-- Jump up the tree with '[[' or ']]'
	buf_set_keymap('n', '[[', '<cmd>AerialPrevUp<CR>', opts)
	buf_set_keymap('n', ']]', '<cmd>AerialNextUp<CR>', opts)

	-- Diagnostic hover
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float(nil, {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			})
		end
	})

	-- Illuminate
	require("illuminate").on_attach(client)
end

protocol.CompletionItemKind = {
	'', -- Text
	'', -- Method
	'', -- Function
	'', -- Constructor
	'', -- Field
	'', -- Variable
	'', -- Class
	'ﰮ', -- Interface
	'', -- Module
	'', -- Property
	'', -- Unit
	'', -- Value
	'', -- Enum
	'', -- Keyword
	'﬌', -- Snippet
	'', -- Color
	'', -- File
	'', -- Reference
	'', -- Folder
	'', -- EnumMember
	'', -- Constant
	'', -- Struct
	'', -- Event
	'ﬦ', -- Operator
	'', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.flow.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
	root_dir = function() return vim.loop.cwd() end
}

nvim_lsp.sumneko_lua.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		enable_format_on_save(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
		},
	},
}

nvim_lsp.tailwindcss.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "javascriptreact", "typescriptreact", "svelte" }
}

nvim_lsp.solc.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = nvim_lsp.util.root_pattern('hardhat.config.*', '.git'),
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
}
)
-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = '●'
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
