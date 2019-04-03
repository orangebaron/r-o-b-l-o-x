require("getLivingPlayers")

return function()
	for _, plr in pairs(getLivingPlayers()) do
		plr.LoadCharacter()
	end
end
