require("genSpectatorArea")
require("genBaseMap")
require("playerAdded")

return function()
	genSpectatorArea().Parent = Workspace
	genBaseMap().Parent = Workspace
	game:GetService("Players").PlayerAdded:connect(playerAdded)
end
