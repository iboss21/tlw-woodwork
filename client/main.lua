-- Client-side main initialization

local playerData = {}
local playerSkills = {}
local playerInventory = {}
local nearbyTrees = {}
local inBuildMode = false

-- Initialize
Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(100)
    end
    
    -- Request player data
    TriggerServerEvent('lxr-woodwork:server:getSkills')
    TriggerServerEvent('lxr-woodwork:server:getInventory')
    
    print('^2[LXR-Woodwork]^7 Client initialized')
end)

-- Receive skills from server
RegisterNetEvent('lxr-woodwork:client:receiveSkills', function(skills)
    playerSkills = skills
    if Config.Debug then
        print('[LXR-Woodwork] Received player skills')
    end
end)

-- Receive inventory from server
RegisterNetEvent('lxr-woodwork:client:receiveInventory', function(inventory)
    playerInventory = inventory
    if Config.Debug then
        print('[LXR-Woodwork] Received player inventory')
    end
end)

-- Skill updated
RegisterNetEvent('lxr-woodwork:client:skillUpdated', function(skillName, newLevel, newXP)
    if playerSkills then
        playerSkills[skillName] = newLevel
        playerSkills[skillName .. '_xp'] = newXP
    end
end)

-- Draw 3D text
function Draw3DText(coords, text)
    local onScreen, x, y = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
        local factor = (string.len(text)) / 370
        DrawRect(x, y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
    end
end

-- Show notification
function ShowNotification(message, type)
    -- This would use the framework's notification system
    -- Placeholder implementation
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

-- Check if player has tool
function HasRequiredTool(toolType)
    -- This would check player inventory for tool
    -- Placeholder - always return true for now
    return true
end

-- Get player skill level
function GetPlayerSkillLevel(skillName)
    return playerSkills and playerSkills[skillName] or 0
end

-- Exports for other resources
exports('GetPlayerSkills', function()
    return playerSkills
end)

exports('GetPlayerInventory', function()
    return playerInventory
end)

-- Utility functions
function GetClosestTree()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local closestTree = nil
    local closestDistance = 999999
    
    for _, tree in pairs(nearbyTrees) do
        local distance = #(playerCoords - vector3(tree.coords.x, tree.coords.y, tree.coords.z))
        if distance < closestDistance and distance < 3.0 then
            closestDistance = distance
            closestTree = tree
        end
    end
    
    return closestTree, closestDistance
end

-- Main thread for interactions
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        
        -- Check for nearby trees
        local closestTree, distance = GetClosestTree()
        
        if closestTree and distance < 3.0 then
            if closestTree.state == 'healthy' then
                Draw3DText(closestTree.coords, Locale['press_to_interact']:format(Locale['chop_tree']))
                
                if IsControlJustReleased(0, 0x760A9C6F) then -- G key
                    TriggerEvent('lxr-woodwork:client:startChopping', closestTree)
                end
            elseif closestTree.state == 'fallen' then
                Draw3DText(closestTree.coords, Locale['press_to_interact']:format(Locale['buck_tree']))
                
                if IsControlJustReleased(0, 0x760A9C6F) then
                    TriggerEvent('lxr-woodwork:client:startBucking', closestTree)
                end
            end
        end
    end
end)

-- Update nearby trees (would sync with server)
RegisterNetEvent('lxr-woodwork:client:updateNearbyTrees', function(trees)
    nearbyTrees = trees
end)

-- Tree respawned
RegisterNetEvent('lxr-woodwork:client:treeRespawned', function(treeId)
    if nearbyTrees[treeId] then
        nearbyTrees[treeId].state = 'healthy'
        nearbyTrees[treeId].health = 100
    end
end)

-- Business created
RegisterNetEvent('lxr-woodwork:client:businessCreated', function(businessId)
    ShowNotification(Locale['business_created'], 'success')
    -- Refresh UI or do something
end)

-- Camp removed
RegisterNetEvent('lxr-woodwork:client:campRemoved', function(campId)
    -- Remove camp from client-side cache
    if Config.Debug then
        print('[LXR-Woodwork] Camp ' .. campId .. ' removed')
    end
end)
