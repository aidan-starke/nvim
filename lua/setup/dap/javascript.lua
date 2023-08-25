local M = {}

M.launch = {
	name = "Launch",
	type = "node2",
	request = "launch",
	program = "${file}",
	cwd = vim.loop.cwd(),
	sourceMaps = true,
	protocol = "inspector",
	console = "integratedTerminal",
}

M.attach = {
	-- For this to work you need to make sure the node process
	-- is started with the `--inspect` flag.
	name = "Attach to process",
	type = "node2",
	request = "attach",
	processId = require("dap.utils").pick_process,
}

return M
