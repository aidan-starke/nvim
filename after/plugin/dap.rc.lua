local status_one, dap = pcall(require, "dap")
if not status_one then return end

local status_two, dapui = pcall(require, "dapui")
if not status_two then return end

local status_three, daptext = pcall(require, "nvim-dap-virtual-text")
if not status_three then return end

daptext.setup({})
dapui.setup({
	layouts = {
		{
			elements = {
				"console",
			},
			size = 7,
			position = "bottom",
		},
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"watches",
			},
			size = 40,
			position = "left",
		}
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({ layout = 1 })
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end

require("setup.node-dap");

local nnoremap = require("setup.keymap").nnoremap

require("setup.helpers").set_keymaps(nnoremap, {
	{ "<leader>dt1", function()
		dapui.toggle({ layout = 1 })
	end },
	{ "<leader>dt2", function()
		dapui.toggle({ layout = 2 })
	end },
	{ "<leader>dc", function()
		dap.close()
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
	{ "<Leader>db", function()
		dap.toggle_breakpoint()
	end },
	{ "<Leader>dB", function()
		dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
	end },
	{ "<leader>drc", function()
		dap.run_to_cursor()
	end },
})
