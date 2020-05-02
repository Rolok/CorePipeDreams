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
local COMPONENT_ROOT = script:GetCustomProperty("ComponentRoot"):WaitForObject()
local CANVAS = script:GetCustomProperty("Canvas"):WaitForObject()
local PANEL = script:GetCustomProperty("Panel"):WaitForObject()
local LINE_TEMPLATE = script:GetCustomProperty("LineTemplate")
local COLORTEAM = {}
local settings = script:GetCustomProperty("GameSettings"):WaitForObject()
local VICTORYCOUNT = settings:GetCustomProperty("VictoryCount")
COLORTEAM[1] = Color.SAPPHIRE
COLORTEAM[2] = Color.RUBY
COLORTEAM[3] = Color.MAGENTA
COLORTEAM[4] = Color.EMERALD

-- User exposed properties
local BINDING = COMPONENT_ROOT:GetCustomProperty("Binding")

-- Constants
local LOCAL_PLAYER = Game.GetLocalPlayer()

-- Variables  bindingDown as true starts out with it on by default.
local headerLine = nil
local playerLines = {}
local bindingDown = true

-- Set up so that it will toggle on press
-- nil OnBindingPressed(Player, string)
-- Keep track of the binding state to show the scoreboard 
function OnBindingPressed(player, binding)
    if binding == BINDING then
--        bindingDown = false
    end
end
-- nil OnBindingReleased(Player, string)
-- Keep track of the binding state to show the scoreboard 
function OnBindingReleased(player, binding)
    if binding == BINDING then
        bindingDown = not bindingDown
    end
end



-- bool ComparePlayers(Player, Player)
-- Comparing function that sets the sorting order
function ComparePlayers(player1, player2)
    -- Order by teams then name.
    if player1.team ~= player2.team then
        return player1.team < player2.team
    end
    return player1.name < player2.name
end


function DrawHeaderLine(offset)
	headerLine = World.SpawnAsset(LINE_TEMPLATE, {parent = PANEL})
	headerLine.y = offset
	headerLine:GetCustomProperty("Name"):WaitForObject().text = "Name"
	headerLine:GetCustomProperty("KillsText"):WaitForObject().text = "Sections"
end 

-- nil OnPlayerJoined(Player)
-- Add a line to the scoreboard when a player joins
function OnPlayerJoined(player)
	print("player joined")
    local newLine = World.SpawnAsset(LINE_TEMPLATE, {parent = PANEL})
    newLine.y =  -10 - newLine.height * (#playerLines + 1)
    table.insert(playerLines, newLine)
    headerLine.y = newLine.y - 40
end

-- nil OnPlayerLeft(Player)
-- Remove a line when a player leaves
function OnPlayerLeft(player)
    headerLine.y = headerLine.y + 30
    playerLines[#playerLines]:Destroy()
    playerLines[#playerLines] = nil
end

-- nil Tick(float)
-- Update visibility and displayed information
function Tick(deltaTime)
    if atRoundEnd and time() - roundEndTime > ROUND_END_DURATION then
        atRoundEnd = false
    end

    if bindingDown or atRoundEnd then
        CANVAS.visibility = Visibility.INHERIT

        local players = Game.GetPlayers() 
        -- table.sort(players, ComparePlayers)

        for i, player in ipairs(players) do
        	if Object.IsValid(playerLines[i]) then
	            local teamColor = COLORTEAM[player.team]
	            local line = playerLines[i]
	            line:GetCustomProperty("Name"):WaitForObject().text = player.name
	            line:GetCustomProperty("Name"):WaitForObject():SetColor(teamColor)
	            local progress = tostring(player:GetResource("TubeControl")) .. " / " .. VICTORYCOUNT
	            line:GetCustomProperty("KillsText"):WaitForObject().text = progress
            end
        end
    else
        CANVAS.visibility = Visibility.FORCE_OFF
    end
end

-- Initialize
CANVAS.visibility = Visibility.FORCE_ON


DrawHeaderLine(-180)

Game.playerLeftEvent:Connect(OnPlayerLeft)
Game.playerJoinedEvent:Connect(OnPlayerJoined)
LOCAL_PLAYER.bindingPressedEvent:Connect(OnBindingPressed)
LOCAL_PLAYER.bindingReleasedEvent:Connect(OnBindingReleased)

