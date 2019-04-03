local Players = game:GetService("Players")
return function()
	local plrs = {}
	for _, plr in pairs(Players:GetPlayers()) do
		if plr.Character and plr.Character.Parent and plr.Character:FindFirstChild("Alive") then
			table.insert(plrs, plr)
		end
	end
	return plrs
end
