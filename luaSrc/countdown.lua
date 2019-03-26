require("getEligiblePlayers")

function countdown(time, repeatedFunction)
	if time == 0 then
		return nil
	end

	local eligiblePlayers = getEligiblePlayers()
	if #eligiblePlayers == 0 then
		return nil
	elseif #eligiblePlayers == 1 then
		return eligiblePlayers[1]
	end

	print(time) --TODO: display this on users' screens
	repeatedFunction(time)

	wait(1)
	return countdown(time - 1, repeatedFunction)
end

return countdown
