local ABGS = require(script:GetCustomProperty("API"))

local fullTriggerMap = World.FindObjectsByType("Trigger")
local teleportTriggerMap = {}
local triggerCount = 0


-- create table of triggers for teleportation
for _, captureTubeTrigger in pairs(fullTriggerMap) do
	if captureTubeTrigger.name == "CaptureTubeTrigger" then
		triggerCount = triggerCount + 1
		teleportTriggerMap[triggerCount] = captureTubeTrigger.id
	end
	
end

-- function to connect event handlers to ability events 
function ConnectAbilityEvents_Teleport(ability)
	-- hooks on entering each phase
	ability.castEvent:Connect(OnCast_Teleport)
	ability.executeEvent:Connect(OnExecute_Teleport)
	ability.recoveryEvent:Connect(OnRecovery_Teleport)
	ability.cooldownEvent:Connect(OnCooldown_Teleport)
		
	ability.interruptedEvent:Connect(OnInterrupted_Teleport)
	ability.readyEvent:Connect(OnReady_Teleport)
			
end

-- functions called when entering each phase. Add your code inside 
function OnCast_Teleport(ability)
	-- print("OnCast " .. ability.name)
end


function OnExecute_Teleport(ability)
	-- print("OnExecute " .. ability.name)
	-- print("ABGS GetGameState -- " .. ABGS:GetGameState())
	local activeGameState = ABGS:GetGameState()	
	if activeGameState == 1 then
		------------------------------------
		-- pick a random trigger location to teleport to and move the player there.
		local randomTrigger = math.random(triggerCount)
		local randomTriggerID = teleportTriggerMap[randomTrigger]	
		local triggerToTeleportTo = World.FindObjectById(randomTriggerID)
		local newPosition = triggerToTeleportTo:GetWorldPosition()
	
		ability.owner:SetWorldPosition(newPosition)    
		---------------------------------------
	else
		print("teleportion only works during the round")
	end
	
	-- if isTargetDataUpdated is set to true on ability phase, targetData can be used
	local targetData = ability:GetTargetData()
end

function OnRecovery_Teleport(ability)
	-- print("OnRecovery " .. ability.name)
end

function OnCooldown_Teleport(ability)
	-- print("OnCooldown " .. ability.name)
end

function OnInterrupted_Teleport(ability)
	-- print("OnInterrupted " .. ability.name)
end

function OnReady_Teleport(ability)
	-- print("OnReady " .. ability.name)
end


-- reference to ability object, modify as needed
local teleportAbility = script.parent

-- call to connect events to ability. 
-- this does not give the ability to player, that need to be handled separately depending on how ability is created in game
ConnectAbilityEvents_Teleport(teleportAbility)

--------------------------------------------------------------------------------