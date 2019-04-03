require("genSpectatorArea")
require("playerAdded")

return function()
	genSpectatorArea().Parent = Workspace
	game:GetService("Players").PlayerAdded:connect(playerAdded)
end
