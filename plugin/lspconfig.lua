local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

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
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local set_keymaps = function(pairs)
		for _, pair in ipairs(pairs) do
			local key, map = unpack(pair)

			buf_set_keymap('n', key, map, { noremap = true, silent = true })
		end
	end

	set_keymaps({
		{ 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>' },
		{ 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>' },
		{ 'K', '<cmd>lua vim.lsp.buf.hover()<CR>' },
		{ 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>' },
		{ 'gr', '<cmd>lua vim.lsp.buf.references()<CR>' },
		{ 'gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>' },
		{ 'li', '<cmd>LspInfo<CR>' },
		{ 'lI', '<cmd>LspInstallInfo<CR>' },
		{ 'la', '<cmd>lua vim.lsp.buf.code_action()<CR>' },
		{ 'lr', '<cmd>lua vim.lsp.buf.rename()<CR>' },
		-- Aerial
		{ ';a', '<cmd>AerialToggle<CR>' },
		{ '{', '<cmd>AerialNext<CR>' },
		{ '}', '<cmd>AerialPrev<CR>' },
		{ ']]', '<cmd>lua require("aerial").next_up()<CR>' },
		{ '[[', '<cmd>lua require("aerial).prev_up()<CR>' }
	})

	-- Diagnostic hover
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float(nil, {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "double",
				source = "always",
				prefix = " ",
				scope = "cursor",
			})
		end
	})

	-- Illuminate
	require("illuminate").on_attach(client)

	-- Signature
	require("lsp_signature").on_attach({
		bind = true,
		hint_enable = true,
		toggle_key = "<C-m>",
		hint_prefix = "🤔  ",
		hint_scheme = "String",
		floating_window = false,
		handler_opts = {
			border = "double"
		}
	}, bufnr)
end

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" }),
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
	"sumneko_lua",
	"tsserver",
	"solidity",
	"rust_analyzer"
}

local opts = {}

for _, lsp in ipairs(servers) do
	opts = {
		handlers = handlers,
		on_attach = on_attach,
		capabilities = capabilities,
	}
	local merge_opts = function(m_opts)
		return vim.tbl_deep_extend("force", opts, m_opts)
	end

	if lsp == "sumneko_lua" then
		local lua_opts = {
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
		}
		opts = merge_opts(lua_opts)
	end

	if lsp == "tailwindcss" then
		local tailwind_opts = {
			filetypes = { "javascriptreact", "typescriptreact", "svelte" }
		}
		opts = merge_opts(tailwind_opts)
	end

	if lsp == "solidity" then
		local solidity_opts = {
			cmd = { "solidity-ls", "--stdio" },
		}
		opts = merge_opts(solidity_opts)
	end

	if lsp == "rust_analyzer" then
		require("rust-tools").setup {
			tools = {
				on_initialized = function()
					vim.cmd [[autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()]]
				end,
			},
			server = merge_opts({
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
