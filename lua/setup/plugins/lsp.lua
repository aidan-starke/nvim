local bind = require("setup.keymap").bind
local set_keymaps = require("setup.helpers").set_keymaps

return {
	"ray-x/lsp_signature.nvim",
	"mfussenegger/nvim-lint", -- Linting
	"stevearc/conform.nvim", -- Formatting

	{
		"simrat39/rust-tools.nvim",
		"pmizio/typescript-tools.nvim",
	}, -- Language specific tools

	{
		"folke/lazydev.nvim",
		ft = "lua"
	}, -- Lua specific

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup({
				window = {
					blend = 0,
				},
			})
		end,
	}, -- Visual progress

	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("lspconfig.ui.windows").default_options.border = "rounded"

			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			---@diagnostic disable-next-line: missing-fields
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end,
	}, -- Server management

	{
		"hrsh7th/nvim-cmp",
		event = "LspAttach",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp = require("cmp")
			local mapping = require("cmp.config.mapping")
			local bordered = require("cmp.config.window").bordered()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = mapping.preset.insert({
					["<C-d>"] = mapping.scroll_docs(4),
					["<C-u>"] = mapping.scroll_docs(-4),
					["<C-e>"] = mapping.close(),
					["<CR>"] = mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "luasnip" },
				}),
				window = {
					completion = bordered,
					documentation = bordered,
				},
				formatting = {
					format = require("lspkind").cmp_format(),
				},
			})

			vim.cmd([[
					set completeopt=menuone,noinsert,noselect
					highlight! default link CmpItemKind CmpItemMenuDefault
			]])
		end,
	}, -- Completions

	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local luasnip = require("luasnip")
			local types = require("luasnip.util.types")

			require("luasnip.loaders.from_vscode").lazy_load()

			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = { { "<-- choose wisely", "Comment" } },
						},
					},
				},
			})

			set_keymaps(bind({ "i", "s" }), {
				{
					"<C-k>",
					function()
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						end
					end,
				},
				{
					"<C-j>",
					function()
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						end
					end,
				},
				{
					"<C-c>",
					function()
						if luasnip.choice_active() then
							luasnip.change_choice(1)
						end
					end,
				},
			}, { silent = true })
		end,
	}, -- Snippets
}
