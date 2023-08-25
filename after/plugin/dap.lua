local ok, dap = pcall(require, "dap")
local okay, daptext = pcall(require, "nvim-dap-virtual-text")
local rokay, mason_registry = pcall(require, "mason-registry")

if not ok or not okay or not rokay then
	return
end

daptext.setup({})

dap.listeners.after.event_initialized["yeet"] = function()
	dap.repl.open()
end
dap.listeners.before.event_exited["yeet"] = function()
	dap.repl.close()
end

dap.adapters.node2 = {
	command = "node",
	type = "executable",
	args = {
		mason_registry.get_package("node-debug2-adapter"):get_install_path() .. "/out/src/nodeDebug.js",
	},
}

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#installation-with-homebrew
dap.adapters.lldb = {
	name = "lldb",
	type = "executable",
	command = "/opt/homebrew/opt/llvm/bin/lldb-vscode", -- $(brew --prefix llvm)/bin
}

local javascript = require("setup.dap.javascript")
local typescript = require("setup.dap.typescript")

dap.configurations.typescript = {
	typescript.node,
	typescript.jest,
}

dap.configurations.javascript = {
	javascript.launch,
	javascript.attach,
}

dap.configurations.rust = {
	require("setup.rust").dap_configuration,
}

local nnoremap = require("setup.keymap").nnoremap

require("setup.helpers").set_keymaps(nnoremap, {
	{
		"<leader>dc",
		function()
			dap.close()
			dap.repl.close()
		end,
	},
	{
		"<leader><Up>",
		function()
			dap.continue()
		end,
	},
	{
		"<leader><Down>",
		function()
			dap.step_over()
		end,
	},
	{
		"<leader><Right>",
		function()
			dap.step_into()
		end,
	},
	{
		"<leader><Left>",
		function()
			dap.step_out()
		end,
	},
	{
		"<leader>db",
		function()
			dap.toggle_breakpoint()
		end,
	},
	{
		"<leader>dB",
		function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
	},
	{
		"<leader>drc",
		function()
			dap.run_to_cursor()
		end,
	},
})
