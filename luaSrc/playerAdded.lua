require("characterAdded")

return function(plr)
	Instance.new("IntValue", plr).Name = "Kills"
	Instance.new("IntValue", plr).Name = "Class"
	plr.Class.Value = 1
	plr.CharacterAdded:connect(characterAdded)
end
