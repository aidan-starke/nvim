local nnoremap = require("setup.keymap").nnoremap
local vnoremap = require("setup.keymap").vnoremap

local set_keymaps = require("setup.helpers").set_keymaps

-- Normal mode
set_keymaps(nnoremap,
	{
		-- Toggle FileTree
		{ "<leader>nt",       "<cmd>NvimTreeToggle<CR>" },

		-- ToggleTerm
		{ "<leader>tt",       "<cmd>ToggleTerm direction=float<CR>" },

		-- Select All
		{ "<leader>sa",       "gg<S-v>G" },

		-- Focus
		{ "<leader>st",       "<cmd>FocusToggle<CR>" },
		{ "<leader>ss",       "<cmd>FocusSplitNicely<CR>" },
		{ "<leader><leader>", "<cmd>FocusSplitCycle<CR>" },
		-- Split tab
		{ "<leader>sd",       "<cmd>FocusSplitDown<CR>" },
		{ "<leader>sr",       "<cmd>FocusSplitRight<CR>" },
		-- Move to left split tab
		{ "<leader>sh",       "<C-w>h" },
		-- Move to right split tab
		{ "<leader>sl",       "<C-w>l" },
		-- Move to top split tab
		{ "<leader>sk",       "<C-w>k" },
		-- Move to bottom split tab
		{ "<leader>sj",       "<C-w>j" },

		-- New tab
		{ "<leader>tn",       ":tabedit " },
		-- Switch to right tab
		{ "<leader>tk",       "<cmd>tabnext<CR>" },
		-- Switch to left tab
		{ "<leader>tj",       "<cmd>tabprevious<CR>" },

		-- Markdown
		{ "<leader>md",       "<cmd>MarkdownPreviewToggle<CR>" },

		-- Undotree
		{ "<leader>ut",       "<cmd>UndotreeToggle<CR>" },
		-- Redo
		{ "U",                "<cmd>redo<CR>" },
	}
)

-- Visual mode
set_keymaps(vnoremap,
	{
		-- Move line down
		{ "J", ":m '>+1<CR>gv=gv" },
		-- Move line up
		{ "K", ":m '<-2<CR>gv=gv" },
	}
)
