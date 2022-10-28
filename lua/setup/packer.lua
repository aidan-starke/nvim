vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'EdenEast/nightfox.nvim' -- nightfox colorscheme
	use 'feline-nvim/feline.nvim' -- Statusline
	use 'kyazdani42/nvim-web-devicons' -- Icons
	use 'nvim-lua/plenary.nvim' -- Common utilities
	use 'onsails/lspkind-nvim' -- vscode-like pictograms
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
	use 'hrsh7th/nvim-cmp' -- Completion
	use 'neovim/nvim-lspconfig' -- LSP
	use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use 'williamboman/mason.nvim' -- LSP manager
	use 'williamboman/mason-lspconfig.nvim'
	use 'simrat39/rust-tools.nvim' -- Rust tools
	use 'j-hui/fidget.nvim' -- Visual LSP progress
	use 'ray-x/lsp_signature.nvim' -- LSP signature help
	use 'L3MON4D3/LuaSnip' -- Snippets
	use 'wellle/context.vim' -- Keep function definition visible
	use 'kdheepak/lazygit.nvim' -- Visual git integration
	use 'nvim-telescope/telescope-file-browser.nvim' -- File browser
	use 'windwp/nvim-autopairs' -- Auto brackets
	use 'windwp/nvim-ts-autotag' -- Auto html tags
	use 'norcalli/nvim-colorizer.lua' -- Color highlight
	use 'github/copilot.vim' -- Copilot
	use 'sbdchd/neoformat' -- Code formatting
	use 'mvllow/modes.nvim' -- Highlight line based on mode
	use 'sudormrfbin/cheatsheet.nvim' -- Commands cheatsheet
	use 'nat-418/boole.nvim' -- Toggle booleans, dates, etc
	use 'ggandor/leap.nvim' -- Leap to a character
	use 'ThePrimeagen/harpoon' -- Create and move between marks
	use 'numToStr/Comment.nvim' -- Commenting shortcuts
	use 'JoosepAlviste/nvim-ts-context-commentstring' -- JSX/TSX commenting
	use 'maxmellon/vim-jsx-pretty' -- JSX/TSX syntax highlighting
	use 'stevearc/aerial.nvim' -- Code outline window
	use 'RRethy/vim-illuminate' -- Highlight word under cursor
	use 'lewis6991/impatient.nvim' -- Speed up startup
	use 'lukas-reineke/indent-blankline.nvim' -- Indent guides
	use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end } -- Window management
	use {
		'nvim-tree/nvim-tree.lua',
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	} -- File tree
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	} -- Treesitter
	use { "akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end } -- Popup windows
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	}) -- File search
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	}) -- Markdown preview
end)
