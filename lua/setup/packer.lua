vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
	function(use)
		use 'wbthomason/packer.nvim'

		use 'nvim-lua/plenary.nvim' -- Common utils

		use 'EdenEast/nightfox.nvim' -- nightfox colorscheme

		use 'kyazdani42/nvim-web-devicons' -- Icons

		use 'windwp/nvim-autopairs' -- Auto brackets

		use 'windwp/nvim-ts-autotag' -- Auto html tags

		use 'norcalli/nvim-colorizer.lua' -- Color highlight

		use 'github/copilot.vim' -- Copilot

		use 'mvllow/modes.nvim' -- Highlight line based on mode

		use 'sudormrfbin/cheatsheet.nvim' -- Commands cheatsheet

		use 'nat-418/boole.nvim' -- Toggle booleans, dates, etc

		use 'phaazon/hop.nvim' -- Hop to a character

		use 'ThePrimeagen/harpoon' -- Create and move between marks

		use 'numToStr/Comment.nvim' -- Commenting shortcuts

		use 'JoosepAlviste/nvim-ts-context-commentstring' -- JSX/TSX commenting

		use 'maxmellon/vim-jsx-pretty' -- JSX/TSX syntax highlighting

		use 'RRethy/vim-illuminate' -- Highlight and find other occurences of word under cursor

		use 'lukas-reineke/indent-blankline.nvim' -- Indent guides

		use 'mbbill/undotree' -- Undo history

		use 'gelguy/wilder.nvim' -- Command line hints

		use 'feline-nvim/feline.nvim' -- Statusline

		use 'petertriho/nvim-scrollbar' -- Scrollbar

		use 'kdheepak/lazygit.nvim' -- Visual Git

		use 'sindrets/diffview.nvim' -- Git diff

		use 'xorid/swap-split.nvim' -- Swap split buffers

		use {
			'hrsh7th/nvim-cmp',
			'L3MON4D3/LuaSnip',
			'j-hui/fidget.nvim',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'onsails/lspkind-nvim',
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'simrat39/rust-tools.nvim',
			'ray-x/lsp_signature.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'williamboman/mason-lspconfig.nvim',
		} -- LSP

		use {
			'nvim-tree/nvim-tree.lua',
			tag = 'nightly'
		} -- File tree

		use {
			'lewis6991/impatient.nvim',
			config = function()
				require('impatient')
			end
		} -- Speed up startup

		use {
			'beauwilliams/focus.nvim',
			config = function()
				require('focus').setup()
			end
		} -- Window management

		use {
			'karb94/neoscroll.nvim',
			config = function()
				require('neoscroll').setup()
			end
		} -- Smooth scrolling

		use {
			'akinsho/toggleterm.nvim',
			tag = '*',
			config = function()
				require('toggleterm').setup()
			end
		} -- Popup windows

		use {
			"lewis6991/gitsigns.nvim",
			config = function()
				require('gitsigns').setup()
				require("scrollbar.handlers.gitsigns").setup()
			end
		} -- Git integration

		use {
			'mfussenegger/nvim-dap',
			requires = 'theHamsta/nvim-dap-virtual-text'
		} -- Debugging

		use({
			'nvim-telescope/telescope.nvim',
			requires = {
				{ 'nvim-telescope/telescope-dap.nvim' }, -- Debugging integration
				{ 'nvim-telescope/telescope-file-browser.nvim' }, -- File browser
			},
		}) -- File search

		use {
			'acksld/nvim-neoclip.lua',
			requires = {
				{ 'kkharji/sqlite.lua', module = 'sqlite' },
			},
		} -- Clipboard manager

		use({
			'iamcco/markdown-preview.nvim',
			run = function()
				vim.fn['mkdp#util#install']()
			end,
		}) -- Markdown preview

		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				require('nvim-treesitter.install').update({ with_sync = true })
			end,
		} -- Treesitter ( syntax highlighting etc.. )
	end
)
