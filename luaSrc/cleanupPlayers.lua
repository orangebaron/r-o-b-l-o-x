require("getLivingPlayers")

return function()
	for _, plr in getLivingPlayers() do
		plr.LoadCharacter()
	end
end
