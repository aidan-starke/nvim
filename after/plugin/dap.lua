local ok, dap = pcall(require, "dap")
if not ok then
	return
end

local okay, daptext = pcall(require, "nvim-dap-virtual-text")
if not okay then
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
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/microsoft-sucks/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.loop.cwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process
		-- is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

dap.configurations.typescript = {
	{
		name = "ts-node (Node2 with ts-node)",
		type = "node2",
		request = "launch",
		cwd = vim.loop.cwd(),
		runtimeArgs = {
			"-r",
			"ts-node/register",
			"-r",
			"tsconfig-paths/register", --[[ "-r", "dotenv/config" ]]
		},
		runtimeExecutable = "node",
		args = { "--inspect", "${file}" },
		-- sourceMaps = true,
		skipFiles = { "<node_internals>/**", "node_modules/**" },
	},
	{
		name = "Jest (Node2 with ts-node)",
		type = "node2",
		request = "launch",
		cwd = vim.loop.cwd(),
		runtimeArgs = { "--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest" },
		runtimeExecutable = "node",
		args = { "${file}", "--runInBand", "--coverage", "false" },
		-- sourceMaps = true,
		port = 9229,
		skipFiles = { "<node_internals>/**", "node_modules/**" },
	},
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
