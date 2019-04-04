local dss = game:GetService("DataStoreService")
local winsDs = dss:GetOrderedDataStore("wins0")
local coinsDs = dss:GetOrderedDataStore("coins0")

local coinsFromWin = 20

return function(plr)
	print("winner is " .. tostring(w))
	--TODO: display somehow
	local success, err = pcall(function()
		local wins = winsDs:IncrementAsync(tostring(plr.UserId), 1)
		local coins = coinsDs:IncrementAsync(tostring(plr.UserId), coinsFromWin)
	end)
	print(success, err, wins, coins)
end
