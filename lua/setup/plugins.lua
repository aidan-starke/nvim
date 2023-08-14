local nnoremap = require("setup.keymap").nnoremap
local set_keymaps = require("setup.helpers").set_keymaps

return {
	'nvim-lua/plenary.nvim',                                               -- Common utils

	'kyazdani42/nvim-web-devicons',                                        -- Icons

	'mvllow/modes.nvim',                                                   -- Highlight line based on mode

	'freddiehaddad/feline.nvim',                                           -- Statusline

	'petertriho/nvim-scrollbar',                                           -- Scrollbar

	{ 'EdenEast/nightfox.nvim',              priority = 1000 },            -- nightfox colorscheme

	{ 'github/copilot.vim',                  event = "VeryLazy", },        -- Copilot

	{ 'maxmellon/vim-jsx-pretty',            event = "VeryLazy", },        -- JSX/TSX syntax highlighting

	{ 'phaazon/hop.nvim',                    event = "VeryLazy", },        -- Hop to a character

	{ 'lukas-reineke/indent-blankline.nvim', event = "VeryLazy", },        -- Indent guides

	{ 'kdheepak/lazygit.nvim',               event = "VeryLazy", },        -- Visual Git

	{ 'gelguy/wilder.nvim',                  event = "VeryLazy", },        -- Command line hints

	{ 'ThePrimeagen/harpoon',                event = "VeryLazy", },        -- Create and move between file marks

	{ 'mattkubej/jest.nvim',                 cmd = { 'Jest', 'JestFile' } }, -- Run Jest in nvim

	{
		'mfussenegger/nvim-dap',
		event = "VeryLazy",
		dependencies = 'theHamsta/nvim-dap-virtual-text'
	}, -- Debugging

	{
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
		'folke/neodev.nvim',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp',
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'simrat39/rust-tools.nvim',
		'ray-x/lsp_signature.nvim',
		'jose-elias-alvarez/null-ls.nvim',
		'williamboman/mason-lspconfig.nvim',
		{ 'j-hui/fidget.nvim', tag = 'legacy' },
		{
			'onsails/lspkind-nvim',
			config = function()
				require('lspkind').init()
			end
		}
	}, -- LSP

	{
		'nvim-tree/nvim-tree.lua',
		tag = 'nightly'
	}, -- File tree

	{
		'lewis6991/impatient.nvim',
		config = function()
			require('impatient')
		end
	}, -- Speed up startup

	{
		'beauwilliams/focus.nvim',
		event = "VeryLazy",
		config = function()
			require('focus').setup()
		end,
	}, -- Window management

	{
		'numToStr/Comment.nvim',
		event = "VeryLazy",
		dependencies = {
			'JoosepAlviste/nvim-ts-context-commentstring' -- JSX/TSX commenting
		},
		config = function()
			require('Comment').setup()
		end
	}, -- Commenting shortcuts

	{
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup({
				performance_mode = true
			})
		end
	}, -- Smooth scrolling

	{
		'akinsho/toggleterm.nvim',
		version = '*',
		event = "VeryLazy",
		config = function()
			require('toggleterm').setup({
				float_opts = {
					border = "rounded",
				},
			})
		end
	}, -- Popup windows

	{
		'kylechui/nvim-surround',
		version = '*',
		event = "VeryLazy",
		config = function()
			require('nvim-surround').setup()
		end
	}, -- Edit surrounding brackets/quotes/tags

	{
		'akinsho/git-conflict.nvim',
		event = "VeryLazy",
		version = "*",
		config = true
	}, -- Git conflicts

	{
		'windwp/nvim-autopairs',
		event = "VeryLazy",
		dependencies = {
			'windwp/nvim-ts-autotag' -- Auto html tags
		},
		config = function()
			require('nvim-ts-autotag').setup()
		end
	}, -- Auto brackets

	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require('gitsigns').setup()
			require("scrollbar.handlers.gitsigns").setup()

			set_keymaps(nnoremap, {
				{ "<leader>grh", "<cmd>Gitsigns reset_hunk<CR>" },
				{ "<leader>grb", "<cmd>Gitsigns reset_buffer<CR>" },
				{ "<leader>gb",  "<cmd>Gitsigns blame_line<CR>" },
				{ "<leader>gsb", "<cmd>Gitsigns stage_buffer<CR>" },
				{ "<leader>gsh", "<cmd>Gitsigns stage_hunk<CR>" },
			})
		end
	}, -- Git integration

	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			{ 'nvim-telescope/telescope-dap.nvim' },                   -- Debugging integration
			{ 'nvim-telescope/telescope-file-browser.nvim' },          -- File browser
			{ 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' }, -- Fuzzy finding
			{ 'Theo-Steiner/togglescope' },                            -- Toggle search modes
		},
	},                                                               -- File search

	{
		'iamcco/markdown-preview.nvim',
		event = "VeryLazy",
		build = function()
			vim.fn['mkdp#util#install']()
		end
	}, -- Markdown preview

	{
		'nvim-treesitter/nvim-treesitter',
		build = function()
			require('nvim-treesitter.install').update({ with_sync = true })()
		end,
	}, -- Treesitter ( syntax highlighting etc.. )

	{
		"sustech-data/wildfire.nvim",
		event = "VeryLazy",
		config = function()
			require("wildfire").setup()
		end,
	}, -- Smart selection

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				config = function()
					---@diagnostic disable-next-line: missing-fields
					require("notify").setup({
						fps = 120,
						render = "compact",
						background_colour = "#000000",
					})
				end
			},
		}
	}, -- UI
}
