return function()
	local model = Instance.new("Model")
	model.Name = "MapBase"
	local part = Instance.new("Part", model)
	part.Anchored = true
	part.Position = Vector3.new(2, -1, 0)
	part.Size = Vector3.new(4, 2, 4)
	part.BrickColor = BrickColor.Green()

	return model
end
