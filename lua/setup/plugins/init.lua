local set_keymaps, nnoremap = require("setup.helpers").set_keymaps, require("setup.keymap").nnoremap

return {
	"nvim-lua/plenary.nvim",                                           -- Common utils

	"kyazdani42/nvim-web-devicons",                                    -- Icons

	"mvllow/modes.nvim",                                               -- Highlight line based on mode

	"freddiehaddad/feline.nvim",                                       -- Statusline

	"petertriho/nvim-scrollbar",                                       -- Scrollbar

	{ "EdenEast/nightfox.nvim",              priority = 1000 },        -- nightfox colorscheme

	{ "Exafunction/codeium.nvim" },                                    -- Codeium (AI completion)

	{ "maxmellon/vim-jsx-pretty",            event = "VeryLazy" },     -- JSX/TSX syntax highlighting

	{ "phaazon/hop.nvim",                    event = "VeryLazy" },     -- Hop to a character

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },           -- Indent guides

	{ "kdheepak/lazygit.nvim",               event = "VeryLazy" },     -- Visual Git

	{ "gelguy/wilder.nvim",                  event = "VeryLazy" },     -- Command line hints

	{ "ThePrimeagen/harpoon",                branch = "harpoon2", event = "VeryLazy" }, -- Create and move between file marks

	{
		"mattkubej/jest.nvim",
		cmd = { "Jest", "JestFile", "JestSingle" },
	}, -- Run Jest in nvim

	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = "theHamsta/nvim-dap-virtual-text",
	}, -- Debugging

	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
	}, -- Commenting shortcuts

	{
		"nvim-tree/nvim-tree.lua",
		tag = "nightly",
	}, -- File tree

	{
		"beauwilliams/focus.nvim",
		event = "VeryLazy",
		config = function()
			require("focus").setup()
		end,
	}, -- Window management

	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				performance_mode = true,
			})
		end,
	}, -- Smooth scrolling

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				float_opts = {
					border = "rounded",
				},
			})
		end,
	}, -- Popup windows

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	}, -- Edit surrounding brackets/quotes/tags

	{
		"akinsho/git-conflict.nvim",
		event = "VeryLazy",
		version = "*",
		config = true,
	}, -- Git conflicts

	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		dependencies = {
			"windwp/nvim-ts-autotag", -- Auto html tags
		},
	},                        -- Auto brackets

	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({})
			require("scrollbar.handlers.gitsigns").setup()

			set_keymaps(nnoremap, {
				{ "<leader>grh", "<cmd>Gitsigns reset_hunk<CR>" },
				{ "<leader>grb", "<cmd>Gitsigns reset_buffer<CR>" },
				{ "<leader>gb",  "<cmd>Gitsigns blame_line<CR>" },
				{ "<leader>gsb", "<cmd>Gitsigns stage_buffer<CR>" },
				{ "<leader>gsh", "<cmd>Gitsigns stage_hunk<CR>" },
			})
		end,
	}, -- Git integration

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-dap.nvim" },                  -- Debugging integration
			{ "nvim-telescope/telescope-file-browser.nvim" },         -- File browser
			{ "nvim-telescope/telescope-fzf-native.nvim",  build = "make" }, -- Fuzzy finding
			{ "Theo-Steiner/togglescope" },                           -- Toggle search modes
		},
	},                                                              -- File search

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	}, -- Markdown preview

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
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
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	}, -- Todo comments

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
						top_down = false,
						render = "compact",
						background_colour = "#000000",
					})
				end,
			},
		},
	}, -- UI

	{
		"Aasim-A/scrollEOF.nvim",
		event = "VeryLazy",
		config = function()
			require("scrollEOF").setup()
		end,
	}, -- Scrolloff
}
