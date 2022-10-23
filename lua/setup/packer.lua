vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'shaunsingh/nord.nvim' -- Nord colorscheme
	use 'nvim-lualine/lualine.nvim' -- Statusline
	use 'nvim-lua/plenary.nvim' -- Common utilities
	use 'onsails/lspkind-nvim' -- vscode-like pictograms
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
	use 'hrsh7th/nvim-cmp' -- Completion
	use 'neovim/nvim-lspconfig' -- LSP
	use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use 'williamboman/mason.nvim' -- LSP manager
	use 'williamboman/mason-lspconfig.nvim'
	use 'glepnir/lspsaga.nvim' -- LSP UIs
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
