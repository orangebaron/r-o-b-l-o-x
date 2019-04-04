local dss = game:GetService("DataStoreService")
local killsDs = dss:GetOrderedDataStore("kills0")
local coinsDs = dss:GetOrderedDataStore("coins0")

local coinsFromKill = 2

return function(plr)
	if not plr:FindFirstChild("Kills") then -- this should never happen
		Instance.new("IntValue", plr).Name = "Kills"
		return
	end

	local numKills = plr.Kills.Value
	plr.Kills.Value = 0
	print("awarding " .. tostring(numKills) .. " kills to " .. tostring(w))
	--TODO: display somehow
	local success, err = pcall(function()
		local kills = killsDs:IncrementAsync(tostring(plr.UserId), numKills)
		local coins = coinsDs:IncrementAsync(tostring(plr.UserId), coinsFromKill * numKills)
	end)
	print(success, err, kills, coins)
end
