local timer = vim.loop.new_timer()

if timer == nil then
	return
end

timer:start(10000, 8640, function()
	local time = os.date("*t")

	if time and time.min % 15 == 0 then
		vim.notify("Time to stretch your neck", "warning", {
			title = os.date("%H:%M"),
		})

		-- Don't repeat the notification
		timer:start(60000, 0, function() end)
	end
end)
