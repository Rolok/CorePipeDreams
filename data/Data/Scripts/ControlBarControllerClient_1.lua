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

-- Internal custom properties
local AS = require(script:GetCustomProperty("API"))
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local TEXT_BOX = script:GetCustomProperty("TextBox"):WaitForObject()
local PROGRESS_BAR = script:GetCustomProperty("ProgressBar"):WaitForObject()
local settings = script:GetCustomProperty("GameSettings"):WaitForObject()
local VICTORYCOUNT = settings:GetCustomProperty("VictoryCount")

local COLORTEAM = {}
COLORTEAM[1] = Color.SAPPHIRE
COLORTEAM[2] = Color.RUBY
COLORTEAM[3] = Color.MAGENTA
COLORTEAM[4] = Color.EMERALD

-- User exposed properties
local SHOW_NUMBER = COMPONENT_ROOT:GetCustomProperty("ShowNumber")
local SHOW_MAXIMUM = COMPONENT_ROOT:GetCustomProperty("ShowMaximum")
local TEAM = COMPONENT_ROOT:GetCustomProperty("Team")
local LOCAL_PLAYER = Game.GetLocalPlayer()
local UIIMAGE = script:GetCustomProperty("UIImage"):WaitForObject()
local TEAMUITEXTBOX = script:GetCustomProperty("TeamUITextBox"):WaitForObject()

local controlFraction = 0
local players = Game.GetPlayers()
local numPlayers = #players

-- Player GetViewedPlayer()
-- Returns which player the local player is spectating (or themselves if not spectating)
function GetViewedPlayer()
    local specatatorTarget = AS.GetSpectatorTarget()

    if AS.IsSpectating() and specatatorTarget then
        return specatatorTarget
    end

    return LOCAL_PLAYER
end

if SHOW_NUMBER then
	if SHOW_MAXIMUM then
    	TEXT_BOX.text = string.format("%.0f / %.0f", 0, VICTORYCOUNT)
	else
    	TEXT_BOX.text = string.format("%.0f", 0)
	end
end	

function Tick(deltaTime)
	players = Game.GetPlayers()
	numPlayers = #players
	for n = 1, numPlayers do
		if players[n].team == TEAM then
			controlFraction = players[n]:GetResource("TubeControl") / VICTORYCOUNT
			PROGRESS_BAR.progress = controlFraction
			if LOCAL_PLAYER.team == TEAM then
				UIIMAGE.visibility = Visibility.FORCE_ON
				TEAMUITEXTBOX.visibility = Visibility.FORCE_ON
			end
			
			if SHOW_NUMBER then
				if SHOW_MAXIMUM then
                	TEXT_BOX.text = string.format("%.0f / %.0f", players[n]:GetResource("TubeControl"), VICTORYCOUNT)
            	else
                	TEXT_BOX.text = string.format("%.0f", players[n]:GetResource("TubeControl"))
				end
			end	
            --break
        end
	end
end

-- Initialize
if not SHOW_NUMBER then
    TEXT_BOX.visibility = Visibility.FORCE_OFF
end

PROGRESS_BAR.progress = 0
