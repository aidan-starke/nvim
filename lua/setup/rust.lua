local set_keymaps, nnoremap = require("setup.helpers").set_keymaps, require("setup.keymap").nnoremap

local M = {}

M.set_rust_keymaps = function()
	set_keymaps(nnoremap, {
		{ "<leader>rh", "<cmd>RustSetInlayHints<CR>" },
		{ "<leader>rhd", "<cmd>RustDisableInlayHints<CR>" },
		{ "<leader>rr", "<cmd>RustRunnables<CR>" },
		{ "<leader>rem", "<cmd>RustExpandMacro<CR>" },
		{ "<leader>roc", "<cmd>RustOpenCargo<CR>" },
		{ "<leader>rpm", "<cmd>RustParentModule<CR>" },
		{ "<leader>rjl", "<cmd>RustJoinLines<CR>" },
		{ "<leader>rha", "<cmd>RustHoverActions<CR><cmd>RustHoverActions<CR>" },
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

local function get_rust_types()
	local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

	local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
	local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

	local commands = {}
	local file = io.open(commands_file, "r")
	if file then
		for line in file:lines() do
			table.insert(commands, line)
		end
		file:close()
	end
	table.insert(commands, 1, script_import)

	return commands
end

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-codelldb

M.dap_configuration = {
	name = "Rust",
	type = "lldb",
	request = "launch",
	program = function()
		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
	env = function()
		local variables = {}
		for k, v in pairs(vim.fn.environ()) do
			table.insert(variables, string.format("%s=%s", k, v))
		end
		return variables
	end,
	initCommands = get_rust_types,
}

return M
