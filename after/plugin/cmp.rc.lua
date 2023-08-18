---@diagnostic disable: missing-fields
local status, cmp = pcall(require, "cmp")
if (not status) then return end

local mapping = require("cmp.config.mapping")

local bordered = require("cmp.config.window").bordered()

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = mapping.preset.insert({
		['<C-d>'] = mapping.scroll_docs(4),
		['<C-u>'] = mapping.scroll_docs(-4),
		['<C-e>'] = mapping.close(),
		['<CR>'] = mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
	}),
	window = {
		completion = bordered,
		documentation = bordered,
	},
	formatting = {
		format = require('lspkind').cmp_format(),
	}
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
