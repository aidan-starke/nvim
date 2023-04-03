local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup(
	{
		'nvim-lua/plenary.nvim',                                             -- Common utils

		'EdenEast/nightfox.nvim',                                            -- nightfox colorscheme

		'kyazdani42/nvim-web-devicons',                                      -- Icons

		'norcalli/nvim-colorizer.lua',                                       -- Color highlight

		'github/copilot.vim',                                                -- Copilot

		'mvllow/modes.nvim',                                                 -- Highlight line based on mode

		'maxmellon/vim-jsx-pretty',                                          -- JSX/TSX syntax highlighting

		'freddiehaddad/feline.nvim',                                         -- Statusline

		'petertriho/nvim-scrollbar',                                         -- Scrollbar

		{ 'nat-418/boole.nvim',                  lazy = true },              -- Toggle booleans, dates, etc

		{ 'phaazon/hop.nvim',                    lazy = true },              -- Hop to a character

		{ 'ThePrimeagen/harpoon',                lazy = true },              -- Create and move between marks

		{ 'lukas-reineke/indent-blankline.nvim', lazy = true },              -- Indent guides

		{ 'gelguy/wilder.nvim',                  lazy = true },              -- Command line hints

		{ 'kdheepak/lazygit.nvim',               lazy = true },              -- Visual Git

		{ 'mattkubej/jest.nvim',                 cmd = { 'Jest', 'JestFile' } }, -- Run Jest in nvim

		{
			'hrsh7th/nvim-cmp',
			'L3MON4D3/LuaSnip',
			'j-hui/fidget.nvim',
			'folke/neodev.nvim',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'simrat39/rust-tools.nvim',
			'ray-x/lsp_signature.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'williamboman/mason-lspconfig.nvim',
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
			end
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
				require('neoscroll').setup()
			end
		}, -- Smooth scrolling

		{
			'akinsho/toggleterm.nvim',
			version = '*',
			config = function()
				require('toggleterm').setup()
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
				require('git-conflict').setup()
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
			'mfussenegger/nvim-dap',
			dependencies = 'theHamsta/nvim-dap-virtual-text'
		}, -- Debugging

		{
			'nvim-telescope/telescope.nvim',
			dependencies = {
				{ 'nvim-telescope/telescope-dap.nvim' },                -- Debugging integration
				{ 'nvim-telescope/telescope-file-browser.nvim' },       -- File browser
				{ 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' } -- Fuzzy finding
			},
		},                                                            -- File search

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
	}
)
