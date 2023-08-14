local status, noice = pcall(require, "noice")
if (not status) then return end

local disable = {
	enabled = false,
}

noice.setup({
	lsp = {
		progress = disable,
		signature = disable,
	},
	notify = disable,
	messages = disable,
})
