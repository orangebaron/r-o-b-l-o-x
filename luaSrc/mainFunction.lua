require("mainLoop")

return function()
	while wait() do
		mainLoop()
	end
end
