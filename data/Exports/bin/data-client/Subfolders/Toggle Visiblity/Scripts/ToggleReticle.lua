-------------------------------------------------------------------------------------------------
-- ToggleReticle.lua
-- Author: Kurtis Buckmaster using Seth Leyens TogglePlayer script
-- Toggles player's reticle visibility
-- Client Context
-------------------------------------------------------------------------------------------------

--The key binding for toggling the player's reticle
local TOGGLE_BINDING = script.parent:GetCustomProperty("KeyBinding")

--The local player
local localPlayer = Game.GetLocalPlayer()

---------------------------------------------------------
-- Toggles the player's reticle visibility on or off
-- @param player    The player that pressed the key binding
-- @param binding   The key binding that was pressed
---------------------------------------------------------
local function ToggleReticle(player, binding)
	
	--If the binding matches the toggle binding
	if binding == TOGGLE_BINDING then
	
		if (UI.IsReticleVisible()) then
			UI.SetReticleVisible(false)
		else
			UI.SetReticleVisible(true)
		end

	end
end

--Initialize
local function Init()	
	localPlayer.bindingPressedEvent:Connect(ToggleReticle)
end

Init()
