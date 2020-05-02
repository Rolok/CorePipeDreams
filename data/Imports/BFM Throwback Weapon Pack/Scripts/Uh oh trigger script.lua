local SOUND = script:GetCustomProperty("Sound"):WaitForObject()
local Sound2 = script:GetCustomProperty("Sound2"):WaitForObject()
local Sound3 = script:GetCustomProperty("Sound3"):WaitForObject()
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()
local LOCAL_PLAYER = Game.GetLocalPlayer()

function OnBeginOverlap1(trigger, other)
    if other == LOCAL_PLAYER then
        SOUND:Play()
        Sound2:Play()
        Sound3:Play()
        
    end
end

function OnEndOverlap1(trigger, other)
    if other == LOCAL_PLAYER then
        SOUND:Stop()
        Sound2:Stop()
        Sound3:Stop()
    end
end

TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap1)
TRIGGER.endOverlapEvent:Connect(OnEndOverlap1)
