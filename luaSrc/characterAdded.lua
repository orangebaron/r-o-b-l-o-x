require("classes")

function makeValue(char, name, val)
	local v = Instance.new("IntValue", char)
	v.Name = name
	v.Value = val
end

return function(char)
	local class = 1
	local plr = game.Players:GetPlayerFromCharacter(char)
	if plr and plr:FindFirstChild("Class") then
		class = plr.Class.Value
	end
	local vals = classes[class]
	for k, v in pairs(vals) do
		if k != "WalkSpeed" then
			makeValue(char, k, v)
		else
			char.Humanoid.WalkSpeed = v
		end
	end
end
