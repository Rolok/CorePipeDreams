local EQUIPMENT_TEMPLATE = script:GetCustomProperty('Teleporter')
local MINE_TEMPLATE = script:GetCustomProperty('Mine')

function OnPlayerJoined(player)
    local equipment = World.SpawnAsset(EQUIPMENT_TEMPLATE)
    equipment:Equip(player)
    local mine = World.SpawnAsset(MINE_TEMPLATE)
    mine:Equip(player)
end

Game.playerJoinedEvent:Connect(OnPlayerJoined)