require("getLivingPlayers")

function countdown(time, repeatedFunction)
	if time == 0 then
		return nil
	end

	local livingPlayers = getLivingPlayers()
	if #livingPlayers == 0 then
		return nil
	elseif #livingPlayers == 1 then
		return livingPlayers[1]
	end

	print(time) --TODO: display this on users' screens
	repeatedFunction(time)

	wait(1)
	return countdown(time - 1, repeatedFunction)
end

return countdown
