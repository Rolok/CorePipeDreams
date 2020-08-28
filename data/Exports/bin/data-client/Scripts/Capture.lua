
-- local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local settings = script:GetCustomProperty("GameSettings"):WaitForObject()
local VICTORYCOUNT = settings:GetCustomProperty("VictoryCount")

local propSFX = script:GetCustomProperty("SFX"):WaitForObject()
local areaControlSwitchTrigger = script.parent


local COLORTEAM = {}
COLORTEAM[1] = Color.SAPPHIRE
COLORTEAM[2] = Color.RUBY
COLORTEAM[3] = Color.MAGENTA
COLORTEAM[4] = Color.EMERALD

function OnBeginOverlap(theTrigger, player)
	if player:IsA("Player") then

		local CURRENT_COLOR = areaControlSwitchTrigger.parent:GetColor()
		local teamId = player.team
		local players = Game.GetPlayers()
	    local numPlayers = #players
		local gameOver = World.FindObjectByName("Game Settings"):GetCustomProperty("gameOver")

		if CURRENT_COLOR ~= COLORTEAM[teamId] and gameOver == false then
			-- set tube to new color
			areaControlSwitchTrigger.parent:SetColor(COLORTEAM[teamId])

			-- player took control so add a resource to all players on this team
			for n = 1, numPlayers do
				if players[n].team == teamId then
					players[n]:AddResource("TubeControl",1)
				end
			end

			-- check to see if another player(s) need to have the resource removed
			for i = 1, 4 do
				if CURRENT_COLOR == COLORTEAM[i] then
					-- find players of the team to remove
					for n = 1, numPlayers do
						if players[n].team == i then
							players[n]:RemoveResource("TubeControl",1)
						end
					end
				end
			end


			if player:GetResource("TubeControl") >= VICTORYCOUNT then
				World.FindObjectByName("Game Settings"):SetNetworkedCustomProperty("winningPlayerName", tostring(COLORTEAM[teamId]))
				World.FindObjectByName("Game Settings"):SetNetworkedCustomProperty("gameOver", true)
				World.FindObjectByName("Game Settings"):SetNetworkedCustomProperty("winningColor", COLORTEAM[teamId])
			end

		end

		propSFX:Play()

	end
end

areaControlSwitchTrigger.beginOverlapEvent:Connect(OnBeginOverlap)