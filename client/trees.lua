-- Tree interaction and harvesting client-side

local currentlyChoppingTree = nil
local choppingProgress = 0
local isChopping = false

-- Start chopping tree
RegisterNetEvent('lxr-woodwork:client:startChopping', function(tree)
    if isChopping then return end
    
    -- Check if player has tool
    if not HasRequiredTool('harvesting') then
        ShowNotification(Locale['tool_broken'], 'error')
        return
    end
    
    -- Check skill level
    local treeConfig = Config.Trees.Types[tree.type]
    if not treeConfig then return end
    
    if GetPlayerSkillLevel('felling') < treeConfig.requiredSkill then
        ShowNotification(Locale['tree_too_difficult'], 'error')
        return
    end
    
    -- Check if tree requires two players
    if treeConfig.requiresTwoPlayers and Config.EnableMultiplayerFelling then
        -- Find nearby players
        local nearbyPlayers = GetNearbyPlayers(tree.coords, 5.0)
        if #nearbyPlayers == 0 then
            ShowNotification(Locale['requires_two_players'], 'error')
            return
        end
    end
    
    isChopping = true
    currentlyChoppingTree = tree
    choppingProgress = 0
    
    -- Start chopping animation
    local playerPed = PlayerPedId()
    local animDict = Config.Tools.Animations.hatchet.dict
    local animName = Config.Tools.Animations.hatchet.anim
    
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(10)
    end
    
    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)
    
    -- Chopping thread
    Citizen.CreateThread(function()
        local swingCount = 0
        local requiredSwings = math.ceil(treeConfig.health / Config.Trees.Felling.damagePerSwing)
        
        while isChopping and currentlyChoppingTree do
            Wait(Config.Trees.Felling.swingDuration * 1000)
            
            -- Check if still near tree
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - vector3(tree.coords.x, tree.coords.y, tree.coords.z))
            if distance > 3.0 then
                isChopping = false
                ClearPedTasks(playerPed)
                ShowNotification('You moved too far from the tree', 'error')
                break
            end
            
            swingCount = swingCount + 1
            choppingProgress = (swingCount / requiredSwings) * 100
            
            -- Show progress
            ShowNotification(string.format('Chopping: %.0f%%', choppingProgress), 'info')
            
            -- Check if tree is felled
            if swingCount >= requiredSwings then
                isChopping = false
                ClearPedTasks(playerPed)
                
                -- Tree felled!
                TriggerServerEvent('lxr-woodwork:server:treeFelled', tree.id, tree.type)
                ShowNotification(Locale['tree_fell'], 'success')
                
                -- Start falling animation
                StartTreeFallingAnimation(tree)
                
                currentlyChoppingTree = nil
                break
            end
        end
    end)
end)

-- Start bucking fallen tree
RegisterNetEvent('lxr-woodwork:client:startBucking', function(tree)
    if isChopping then return end
    
    local treeConfig = Config.Trees.Types[tree.type]
    if not treeConfig then return end
    
    isChopping = true
    
    local playerPed = PlayerPedId()
    local animDict = Config.Tools.Animations.saw.dict
    local animName = Config.Tools.Animations.saw.anim
    
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(10)
    end
    
    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)
    
    -- Bucking process
    Citizen.CreateThread(function()
        Wait(Config.Trees.Processing.buck.duration * 1000)
        
        isChopping = false
        ClearPedTasks(playerPed)
        
        -- Give logs
        local logAmount = math.random(treeConfig.logYield.min, treeConfig.logYield.max)
        local logType = tree.type .. '_log'
        
        TriggerServerEvent('lxr-woodwork:server:giveLog', logType, logAmount)
        ShowNotification(string.format(Locale['received_material'], logAmount, logType), 'success')
    end)
end)

-- Tree falling animation
function StartTreeFallingAnimation(tree)
    -- This would implement the physics-based tree falling
    -- For now, just mark as fallen
    tree.state = 'fallen'
    
    -- Play sound effect
    -- PlaySoundFromCoord(-1, Config.Trees.Physics.soundEffect, tree.coords.x, tree.coords.y, tree.coords.z, "0", false, 0, false)
end

-- Get nearby players
function GetNearbyPlayers(coords, radius)
    local players = {}
    local allPlayers = GetActivePlayers()
    
    for _, player in ipairs(allPlayers) do
        if player ~= PlayerId() then
            local targetPed = GetPlayerPed(player)
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(coords - targetCoords)
            
            if distance <= radius then
                table.insert(players, player)
            end
        end
    end
    
    return players
end

-- Cancel chopping
RegisterCommand('cancelchop', function()
    if isChopping then
        isChopping = false
        local playerPed = PlayerPedId()
        ClearPedTasks(playerPed)
        currentlyChoppingTree = nil
        ShowNotification('Chopping cancelled', 'info')
    end
end, false)

-- Tree felled server response
RegisterNetEvent('lxr-woodwork:client:treeFelledConfirmed', function(treeId)
    -- Update local tree state
    if nearbyTrees[treeId] then
        nearbyTrees[treeId].state = 'fallen'
    end
end)
