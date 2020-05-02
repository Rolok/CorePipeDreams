-------------------------------------------------------------------------------------------------
-- ToggleEquipment.lua
-- Author: Kurtis Buckmaster using Seth Leyens TogglePlayer script
-- Toggles player's equipment visibility
-- Client Context
-------------------------------------------------------------------------------------------------

--The key binding for toggling the player's equipment
local TOGGLE_BINDING = script.parent:GetCustomProperty("KeyBinding")

---------------------------------------------------------
-- Toggles the player's equipment visibility on or off
-- @param player    The player that pressed the key binding
-- @param binding   The key binding that was pressed
---------------------------------------------------------
local function ToggleEquipment(player, binding)

	--If the binding matches the toggle binding
	if binding == TOGGLE_BINDING then

		local playerEquipment = player:GetEquipment()
		print(tostring(playerEquipment))

		--Toggle the player's equipment visibility
		local isHidden = player.serverUserData.equipHidden

		player.serverUserData.equipHidden = not isHidden

		for _, equipped in ipairs(playerEquipment) do
			if isHidden then
				equipped.visibility = Visibility.FORCE_ON
			else
				equipped.visibility = Visibility.FORCE_OFF
			end
		end
	end
end
function OnPlayerJoined(player)
	player.bindingPressedEvent:Connect(ToggleEquipment)
end
Game.playerJoinedEvent:Connect(OnPlayerJoined)