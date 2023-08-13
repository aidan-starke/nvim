return {
	'nvim-lua/plenary.nvim',                               -- Common utils

	'EdenEast/nightfox.nvim',                              -- nightfox colorscheme

	'kyazdani42/nvim-web-devicons',                        -- Icons

	'github/copilot.vim',                                  -- Copilot

	'mvllow/modes.nvim',                                   -- Highlight line based on mode

	'maxmellon/vim-jsx-pretty',                            -- JSX/TSX syntax highlighting

	'freddiehaddad/feline.nvim',                           -- Statusline

	'petertriho/nvim-scrollbar',                           -- Scrollbar

	'phaazon/hop.nvim',                                    -- Hop to a character

	'lukas-reineke/indent-blankline.nvim',                 -- Indent guides

	'kdheepak/lazygit.nvim',                               -- Visual Git

	'gelguy/wilder.nvim',                                  -- Command line hints

	'ThePrimeagen/harpoon',                                -- Create and move between file marks

	{ 'mattkubej/jest.nvim', cmd = { 'Jest', 'JestFile' } }, -- Run Jest in nvim

	{
		'mfussenegger/nvim-dap',
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
		config = function()
			require('focus').setup()
		end,
	}, -- Window management

	{
		'numToStr/Comment.nvim',
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
		config = function()
			require('nvim-surround').setup()
		end
	}, -- Edit surrounding brackets/quotes/tags

	{
		'akinsho/git-conflict.nvim',
		config = function()
			require('git-conflict').setup({})
		end
	}, -- Git conflicts

	{
		'windwp/nvim-autopairs',
		dependencies = {
			'windwp/nvim-ts-autotag' -- Auto html tags
		},
		config = function()
			require('nvim-ts-autotag').setup()
		end
	}, -- Auto brackets

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
			require("scrollbar.handlers.gitsigns").setup()
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
	} -- Smart selection
}
