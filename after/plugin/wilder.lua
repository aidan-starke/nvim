local ok, wilder = pcall(require, "wilder")
if not ok then
	return
end

local modes = { ":", "/", "?" }
local options = wilder.wildmenu_renderer({
	mode = "statusline",
	highlighter = wilder.basic_highlighter(),
})

wilder.setup({ modes = modes })
wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = options,
		["/"] = options,
		["?"] = options,
	})
)
