local Players = game:GetService("Players")
return function()
	local plrs = {}
	for _, plr in pairs(Players:GetPlayers()) do
		if plr.Character and plr.Character.Parent and plr.Character.Humanoid and not plr.Character.Humanoid.Sit then
			table.insert(plrs, plr)
		end
	end
	return plrs
end
