
local VICTORY_UI = script.parent
local settings = script:GetCustomProperty("GameSettings"):WaitForObject()
local WINNER_TEXT = "{winner}"
local ORIGINAL_TEXT = VICTORY_UI.text

-- UI.PrintToScreen(VICTORY_UI.text)
-- UI.PrintToScreen("DisplayUI -- victory")

local function OnChanged(settings, key)

    -- UI.PrintToScreen("DisplayUI -- OnChanged")

    local gameOver = settings:GetCustomProperty("gameOver")
    local winner = settings:GetCustomProperty("winningPlayerName")
    if gameOver == true then
        VICTORY_UI.text = string.gsub(ORIGINAL_TEXT, WINNER_TEXT, winner)
        VICTORY_UI:SetColor(settings:GetCustomProperty("winningColor"))
        VICTORY_UI.visibility = Visibility.INHERIT
        Task.Wait(10)
        -- UI.PrintToScreen("Just waited 10 seconds")
        VICTORY_UI.visibility = Visibility.FORCE_OFF
    else
        VICTORY_UI.visibility = Visibility.FORCE_OFF
    end
end

settings.networkedPropertyChangedEvent:Connect(OnChanged)


