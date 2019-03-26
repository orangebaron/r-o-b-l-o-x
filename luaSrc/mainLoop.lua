require("setupMap")
require("setupPlayers")
require("countdown")
require("inGameRepeated")
require("rewardWinner")
require("cleanupMap")
require("cleanupPlayers")

return function()
	setupMap()
	setupPlayers()
	local winner =
		countdown(60, (function(t) end))
		or
		countdown(600, inGameRepeated)
	rewardWinner(winner)
	cleanupMap()
	cleanupPlayers()
end
