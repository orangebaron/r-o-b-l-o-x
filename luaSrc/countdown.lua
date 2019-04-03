require("getLivingPlayers")

function countdown(timeRemaining, repeatedFunction)
	if timeRemaining == 0 then
		return nil
	end

	local livingPlayers = getLivingPlayers()
	if #livingPlayers == 0 then
		return nil
	elseif #livingPlayers == 1 then
		return livingPlayers[1]
	end

	print(timeRemaining) --TODO: display this on users' screens
	repeatedFunction(timeRemaining)

	wait(1)
	return countdown(timeRemaining - 1, repeatedFunction)
end

return countdown
