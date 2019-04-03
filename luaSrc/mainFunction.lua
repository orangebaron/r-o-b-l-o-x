require("mainLoop")
require("initialSetup")

return function()
	initialSetup()
	while wait() do
		mainLoop()
	end
end
