--README
--Set the custom property for what you'd like your binding to be for toggling the UI on and off.
--This script will look for all UIContainer objects on the client and toggle their visibility
--If you have some UI elements on the client that have visibility controlled by tick, then you will need to add
--One more check to their visibility condition - check for _G.UITOGGLE. If true the UI should be on, if false it should be off.
--Example - if LOCAL_PLAYER:GetResource("hat") ~= 0 and _G.UITOGGLE then (show the UI)
--Currently only works for UIContainers in Client Context's.


CONTAINERS = nil
hidden = false
toggle = script.parent:GetCustomProperty("Toggle_UI_Key")
_G.UITOGGLE = true

function toggle_UI(player, binding)

	if binding == toggle then
	
		if hidden == false then
			_G.UITOGGLE = false
			hidden = true

			CONTAINERS = World.FindObjectsByType("UIContainer")
			for _, c in pairs(CONTAINERS) do
				--get containter from a table and its previous state
				c.visibility = Visibility.FORCE_OFF
			end

		else 
			_G.UITOGGLE = true
			hidden = false

			CONTAINERS = World.FindObjectsByType("UIContainer")
			for _, c in pairs(CONTAINERS) do
				--for persistence add container to table with it visibility as a value
				c.visibility = Visibility.INHERIT
			end

		end
	end

end

function player_joined(player)
	player.bindingPressedEvent:Connect(toggle_UI)
end

Game.playerJoinedEvent:Connect(player_joined)