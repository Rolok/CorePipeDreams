-------------------------------------------------------------------------------------------------
-- TogglePlayer.lua
-- Author: Seth Leyens
-- Toggles player's self-visibility
-- Client Context
-------------------------------------------------------------------------------------------------

--The key binding for toggling the player
local TOGGLE_BINDING = script.parent:GetCustomProperty("KeyBinding")

--The local player
local localPlayer = Game.GetLocalPlayer()

---------------------------------------------------------
-- Toggles the player's visibility on or off
-- @param player    The player that pressed the key binding
-- @param binding   The key binding that was pressed
---------------------------------------------------------
local function TogglePlayer(player, binding)
	
	--If the binding matches the toggle binding
	if binding == TOGGLE_BINDING then
	
		--Toggle the player's visibility
		--NOTE: This will only toggle client side visibility, other players will still see this player
		player.isVisibleToSelf = not player.isVisibleToSelf
	end
end

--Initialize
local function Init()	
	localPlayer.bindingPressedEvent:Connect(TogglePlayer)
end

Init()