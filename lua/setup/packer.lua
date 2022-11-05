vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim' -- Common utils
	use 'EdenEast/nightfox.nvim' -- nightfox colorscheme
	use 'feline-nvim/feline.nvim' -- Statusline
	use 'kyazdani42/nvim-web-devicons' -- Icons
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
	use 'windwp/nvim-autopairs' -- Auto brackets
	use 'windwp/nvim-ts-autotag' -- Auto html tags
	use 'norcalli/nvim-colorizer.lua' -- Color highlight
	use 'github/copilot.vim' -- Copilot
	use 'kdheepak/lazygit.nvim' -- Visual Git integration
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
	use 'RRethy/vim-illuminate' -- Highlight and find other occurences of word under cursor
	use 'lewis6991/impatient.nvim' -- Speed up startup
	use 'lukas-reineke/indent-blankline.nvim' -- Indent guides
	use 'mbbill/undotree' -- Undo history
	use 'mfussenegger/nvim-dap' -- Debugging
	use 'theHamsta/nvim-dap-virtual-text' -- Debugging virtual text
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'beauwilliams/focus.nvim', config = function() require('focus').setup() end } -- Window management
	use {
		'nvim-tree/nvim-tree.lua',
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	} -- File tree
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	} -- Treesitter ( syntax highlighting etc.. )
	use { 'akinsho/toggleterm.nvim', tag = '*', config = function()
		require('toggleterm').setup()
	end } -- Popup windows
	use({
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-telescope/telescope-dap.nvim' }, -- Debugging integration
			{ 'nvim-telescope/telescope-fzf-native.nvim' }, -- Fuzzy finding
			{ 'nvim-telescope/telescope-file-browser.nvim' }, -- File browser
		},
	}) -- File search
	use({
		'iamcco/markdown-preview.nvim',
		run = function() vim.fn['mkdp#util#install']() end,
	}) -- Markdown preview
	use {
		'acksld/nvim-neoclip.lua',
		requires = {
			{ 'kkharji/sqlite.lua', module = 'sqlite' },
		},
	} -- Clipboard manager
end)
