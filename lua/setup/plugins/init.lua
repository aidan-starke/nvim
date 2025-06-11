local set_keymaps, nnoremap = require("setup.helpers").set_keymaps, require("setup.keymap").nnoremap

return {
	"nvim-lua/plenary.nvim",                                                          -- Common utils

	"kyazdani42/nvim-web-devicons",                                                   -- Icons

	"mvllow/modes.nvim",                                                              -- Highlight line based on mode

	"freddiehaddad/feline.nvim",                                                      -- Statusline

	"petertriho/nvim-scrollbar",                                                      -- Scrollbar

	{ "EdenEast/nightfox.nvim",              priority = 1000 },                       -- nightfox colorscheme

	{ "github/copilot.vim",                  event = "VeryLazy" },                    -- Copilot

	{ "maxmellon/vim-jsx-pretty",            event = "VeryLazy" },                    -- JSX/TSX syntax highlighting

	{ "phaazon/hop.nvim",                    event = "VeryLazy" },                    -- Hop to a character

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },                          -- Indent guides

	{ "kdheepak/lazygit.nvim",               event = "VeryLazy" },                    -- Visual Git

	{ "gelguy/wilder.nvim",                  event = "VeryLazy" },                    -- Command line hints

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
			{ "nvim-telescope/telescope-dap.nvim" },                   -- Debugging integration
			{ "nvim-telescope/telescope-file-browser.nvim" },          -- File browser
			{ "nvim-telescope/telescope-fzf-native.nvim",  build = "make" }, -- Fuzzy finding
			{ "Theo-Steiner/togglescope" },                            -- Toggle search modes
		},
	},                                                               -- File search

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
					---@diagnostic disable-next-line: missing-fields, undefined-field
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

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		event = "VeryLazy",
		opts = {
			show_help = "yes",
			prompts = {
				-- Code related prompts
				Explain = "Please explain how the following code works.",
				Review = "Please review the following code and provide suggestions for improvement.",
				Tests = "Please explain how the selected code works, then generate unit tests for it.",
				Refactor = "Please refactor the following code to improve its clarity and readability.",
				FixCode = "Please fix the following code to make it work as intended.",
				FixError = "Please explain the error in the following text and provide a solution.",
				BetterNamings = "Please provide better names for the following variables and functions.",
				Documentation = "Please provide documentation for the following code.",
				SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
				SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
				-- Text related prompts
				Summarize = "Please summarize the following text.",
				Spelling = "Please correct any grammar and spelling errors in the following text.",
				Wording = "Please improve the grammar and wording of the following text.",
				Concise = "Please rewrite the following text to make it more concise.",
			},
			model = 'claude-3.5-sonnet', -- GPT model to use, see ':CopilotChatModels' for available models
		},
		keys = {
			{ ";ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code",  mode = { "v" } },
			{ ";ct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
			{
				";cc",
				":CopilotChatToggle<CR>",
				mode = { "n", "x" },
				desc = "CopilotChat",
			},
			{
				";cf",
				"<cmd>CopilotChatFixError<cr>", -- Get a fix for the diagnostic message under the cursor.
				desc = "CopilotChat - Fix Diagnostic",
			},
		}
	}, -- Copilot Chat
}
