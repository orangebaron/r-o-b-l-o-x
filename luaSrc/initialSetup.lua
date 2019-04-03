require("genSpectatorArea")
require("genBaseMap")
require("playerAdded")

genSpectatorArea().Parent = Workspace
genBaseMap().Parent = Workspace
game:GetService("Players").PlayerAdded:connect(playerAdded)
