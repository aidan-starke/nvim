local status, scrollbar = pcall(require, 'scrollbar')
if (not status) then return end

scrollbar.setup({
	show_in_active_only = true,
	excluded_filetypes = {
		"NvimTree"
	}
})
