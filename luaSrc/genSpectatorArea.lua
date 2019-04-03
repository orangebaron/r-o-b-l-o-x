return function()
	local model = Instance.new("Model")
	model.Name = "SpectatorArea"
	local spawnPoint = Instance.new("SpawnLocation", model)
	spawnPoint.Anchored = true
	spawnPoint.Position = Vector3.new(-2, -1, 0)
	spawnPoint.Size = Vector3.new(4, 2, 4)

	return model
end
