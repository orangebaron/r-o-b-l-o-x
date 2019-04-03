require("getEligiblePlayers")

return function()
	for _, plr in pairs(getEligiblePlayers()) do
		Instance.new("Folder", plr.Character).Name = "Alive"
		--TODO teleport to map
	end
end
