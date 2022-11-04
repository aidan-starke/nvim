local status_one, dap = pcall(require, "dap")
if not status_one then return end

local status_two, daptext = pcall(require, "nvim-dap-virtual-text")
if not status_two then return end

daptext.setup({})

dap.listeners.after.event_initialized["yeet"] = function()
	dap.repl.open()
end
dap.listeners.before.event_terminated["yeet"] = function()
	dap.repl.close()
end
dap.listeners.before.event_exited["yeet"] = function()
	dap.repl.close()
end

require("setup.node-dap");

local nnoremap = require("setup.keymap").nnoremap

require("setup.helpers").set_keymaps(nnoremap, {
	{ "<leader>dc", function()
		dap.close()
		dap.repl.close()
	end },
	{ "<leader><Up>", function()
		dap.continue()
	end },
	{ "<leader><Down>", function()
		dap.step_over()
	end },
	{ "<leader><Right>", function()
		dap.step_into()
	end },
	{ "<leader><Left>", function()
		dap.step_out()
	end },
	{ "<leader>db", function()
		dap.toggle_breakpoint()
	end },
	{ "<leader>dB", function()
		dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
	end },
	{ "<leader>drc", function()
		dap.run_to_cursor()
	end },
})
