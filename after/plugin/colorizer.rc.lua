local status, colorizer = pcall(require, "colorizer")
if (not status) then return end

vim.cmd [[set termguicolors]] -- enable 24-bit RGB colors

colorizer.setup({
	'*';
})
