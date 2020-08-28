--[[
Copyright 2019 Manticore Games, Inc. 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

--[[
This component listens for victory events and broadcasts banner messages (that can be seen with the Message Banner
component)
--]]

--List of the various rivers for each player
local RIVERS = script:GetCustomProperty("Rivers"):WaitForObject():GetChildren()

--Winner of the previous round, if any
local previousWinner = 5

-- nil OnPlayerVictory(Player)
-- Announces the winning player
function OnPlayerVictory(player)

	if player == nil then
		Events.Broadcast("TieVictory")
		return
	end
	
	--Get the new winner
	local winningColor = player:GetResource("Costume")

	--Wait 2 seconds, then display the winner
	Task.Wait(2)
	Events.BroadcastToAllPlayers("AddKillFeedKill_Internal", string.format("%s wins!", player.name), 4)
	
	--If there was a previous winner that is different from the new one, we need to disable that river
	if previousWinner ~= 0 and previousWinner ~= winningColor then
		RIVERS[previousWinner].visibility = Visibility.FORCE_OFF
	end
	
	--Update the river for the new winner
	previousWinner = winningColor
	RIVERS[winningColor].visibility = Visibility.INHERIT
end

-- nil OnPlayerVictory(Player)
-- Announces the winning team
function OnTeamVictory(team)
	Events.BroadcastToAllPlayers("AddKillFeedKill_Internal", string.format("Team %d wins!", team), 4)
end

-- nil OnPlayerVictory(Player)
-- Announces that there was a tie
function OnTieVictory(winners)
	Events.BroadcastToAllPlayers("AddKillFeedKill_Internal", "Tie!", 4)
	
	--If there was a previous winner, hide the river
	if previousWinner ~= 0 then
		RIVERS[previousWinner].visibility = Visibility.FORCE_OFF
	end
	
	RIVERS[5].visibility = Visibility.INHERIT
	
	previousWinner = 5
end

-- Initialize
Events.Connect("PlayerVictory", OnPlayerVictory)
Events.Connect("TeamVictory", OnTeamVictory)
Events.Connect("TieVictory", OnTieVictory)
