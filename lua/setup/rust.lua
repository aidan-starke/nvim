local nnoremap = require("setup.keymap").nnoremap

local M = {}

M.set_rust_keymaps = function()
	require("setup.helpers").set_keymaps(nnoremap,
		{
			{ "<leader>rh", "<cmd>RustSetInlayHints<CR>" },
			{ "<leader>rhd", "<cmd>RustDisableInlayHints<CR>" },
			{ "<leader>rr", "<cmd>RustRunnables<CR>" },
			{ "<leader>rem", "<cmd>RustExpandMacro<CR>" },
			{ "<leader>roc", "<cmd>RustOpenCargo<CR>" },
			{ "<leader>rpm", "<cmd>RustParentModule<CR>" },
			{ "<leader>rjl", "<cmd>RustJoinLines<CR>" },
			{ "<leader>rha", "<cmd>RustHoverActions<CR>" },
			{ "<leader>rhr", "<cmd>RustHoverRange<CR>" },
			{ "<leader>rmd", "<cmd>RustMoveItemDown<CR>" },
			{ "<leader>rmu", "<cmd>RustMoveItemUp<CR>" },
			{ "<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<CR>" },
			{ "<leader>rd", "<cmd>RustDebuggables<CR>" },
			{ "<leader>rv", "<cmd>RustViewCRateGraph<Cr>" },
			{ "<leader>rw", "<cmd>RustReloadWorkspace<CR>" },
			{ "<leader>rss", "<cmd>RustSSR<CR>" },
			{ "<leader>rxd", "<cmd>RustOpenExternalDocs<CR>" },
		}, { silent = true })
end

return M
