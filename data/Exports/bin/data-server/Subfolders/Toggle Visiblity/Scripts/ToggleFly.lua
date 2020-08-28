-------------------------------------------------------------------------------------------------
-- ToggleFly.lua
-- Author: Kurtis Buckmaster using Seth Leyens TogglePlayer script
-- Toggles player's equipment visibility
-- Client Context
-------------------------------------------------------------------------------------------------

--The key binding for toggling flying
local TOGGLE_BINDING = script.parent:GetCustomProperty("KeyBinding")

---------------------------------------------------------
-- Toggles flying on or off
-- @param player    The player that pressed the key binding
-- @param binding   The key binding that was pressed
---------------------------------------------------------
local function ToggleFly(player, binding)

	--If the binding matches the toggle binding
	if binding == TOGGLE_BINDING then

		--Toggle flying
		if (player.isFlying) then
			player:ActivateWalking()
		else
			player:ActivateFlying()
		end

	end
end
function OnPlayerJoined(player)
	player.bindingPressedEvent:Connect(ToggleFly)
end
Game.playerJoinedEvent:Connect(OnPlayerJoined)