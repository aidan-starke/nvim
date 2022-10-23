local status, cheatsheet = pcall(require, "cheatsheet")
if (not status) then return end

cheatsheet.setup({
	-- Whether to show bundled cheatsheets
	-- For generic cheatsheets like default, unicode, nerd-fonts, etc
	-- bundled_cheatsheets = {
	--     enabled = {},
	--     disabled = {},
	-- },
	bundled_cheatsheets = true,

	-- For plugin specific cheatsheets
	-- bundled_plugin_cheatsheets = {
	--     enabled = {},
	--     disabled = {},
	-- }
	bundled_plugin_cheatsheets = true,

	-- For bundled plugin cheatsheets, do not show a sheet if you
	-- don't have the plugin installed (searches runtimepath for
	-- same directory name)
	include_only_installed_plugins = true,
})
