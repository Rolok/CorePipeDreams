-- function to connect event handlers to ability events 
function ConnectAbilityEvents_Mine(ability)
	-- hooks on entering each phase
	ability.castEvent:Connect(OnCast_Mine)
	ability.executeEvent:Connect(OnExecute_Mine)
	ability.recoveryEvent:Connect(OnRecovery_Mine)
	ability.cooldownEvent:Connect(OnCooldown_Mine)
		
	ability.interruptedEvent:Connect(OnInterrupted_Mine)
	ability.readyEvent:Connect(OnReady_Mine)
			
end

-- functions called when entering each phase. Add your code inside 
function OnCast_Mine(ability)
	--print("OnCast " .. ability.name)
	--print("location " .. tostring(ability.owner:GetWorldPosition()))
	local mineLocation = ability.owner:GetWorldPosition()
	teamId = ability.owner.team
	--print("team -- " .. teamId)
	
	if teamId == 1 then 
		World.SpawnAsset("5094D5460CC86884:LavaBallSmallTeam1", { position = mineLocation })
	elseif teamId == 2 then
		World.SpawnAsset("E5921CBB0CEB676B:LavaBallSmallTeam2", { position = mineLocation })
	elseif teamId == 3 then
		World.SpawnAsset("AB389A1A10BB8A85:LavaBallSmallTeam3", { position = mineLocation })
	else
		World.SpawnAsset("7D7FFB76137E7D25:LavaBallSmallTeam4", { position = mineLocation })
	end

end

function OnExecute_Mine(ability)
	print("OnExecute " .. ability.name)
	
	-- if isTargetDataUpdated is set to true on ability phase, targetData can be used
	local targetData = ability:GetTargetData()
end

function OnRecovery_Mine(ability)
	-- print("OnRecovery " .. ability.name)
end

function OnCooldown_Mine(ability)
	-- print("OnCooldown " .. ability.name)
end

function OnInterrupted_Mine(ability)
	-- print("OnInterrupted " .. ability.name)
end

function OnReady_Mine(ability)
	-- print("OnReady " .. ability.name)
end


-- reference to ability object, modify as needed
local mine = script.parent
local lavaBall = script:GetCustomProperty("LavaBallSmall")
local teamId = 0
local COLORTEAM = {}
COLORTEAM[1] = Color.SAPPHIRE --cyan
COLORTEAM[2] = Color.RUBY     --orange
COLORTEAM[3] = Color.MAGENTA  --pink
COLORTEAM[4] = Color.EMERALD  --green

-- call to connect events to ability. 
-- this does not give the ability to player, that need to be handled separately depending on how ability is created in game
ConnectAbilityEvents_Mine(mine)

--------------------------------------------------------------------------------