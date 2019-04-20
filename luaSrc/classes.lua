function process(v)
	for _, l in pairs(v) do
		l.MaxHealth = l.Health
	end
	return v
end
return process({
	{
		"MaxHealth": 100,
		"WalkSpeed": 16
	},
	{
		"MaxHealth": 150,
		"WalkSpeed": 10
	}
})
