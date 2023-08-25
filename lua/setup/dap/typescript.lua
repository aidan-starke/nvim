local M = {}

M.node = {
	name = "ts-node (Node2 with ts-node)",
	type = "node2",
	request = "launch",
	cwd = vim.loop.cwd(),
	runtimeArgs = {
		"-r",
		"ts-node/register",
		"-r",
		"tsconfig-paths/register",
		"-r",
		"dotenv/config",
	},
	runtimeExecutable = "node",
	args = { "--inspect", "${file}" },
	-- sourceMaps = true,
	skipFiles = { "<node_internals>/**", "node_modules/**" },
}

M.jest = {
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
}

return M
