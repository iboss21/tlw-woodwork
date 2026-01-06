-- Skills system server-side logic

-- Get player skills
function GetPlayerSkills(identifier)
    local p = promise.new()
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_skills WHERE player_identifier = ?', {identifier}, function(result)
        if result and result[1] then
            p:resolve(result[1])
        else
            -- Create new skill record
            MySQL.Async.execute('INSERT INTO lxr_woodwork_skills (player_identifier) VALUES (?)', {identifier}, function(insertId)
                MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_skills WHERE id = ?', {insertId}, function(newResult)
                    p:resolve(newResult[1])
                end)
            end)
        end
    end)
    return Citizen.Await(p)
end

-- Add XP to skill
function AddSkillXP(source, skillName, xpAmount)
    local identifier = Framework.GetIdentifier(source)
    if not identifier then return false end
    
    local skills = GetPlayerSkills(identifier)
    if not skills then return false end
    
    local currentLevel = skills[skillName] or 0
    local currentXP = skills[skillName .. '_xp'] or 0
    local newXP = currentXP + (xpAmount * Config.SkillXPMultiplier)
    
    -- Check for level up
    local xpNeeded = Utils.GetXPForLevel(currentLevel + 1)
    local newLevel = currentLevel
    
    while newXP >= xpNeeded and newLevel < Config.Skills.XPRequirements.maxLevel do
        newLevel = newLevel + 1
        newXP = newXP - xpNeeded
        xpNeeded = Utils.GetXPForLevel(newLevel + 1)
        
        -- Notify level up
        local title, color = Utils.GetSkillTitle(newLevel)
        Framework.Notify(source, string.format(Locale['skill_increased'], skillName, newLevel), 'success')
        
        -- Check for unlocks
        if Config.Skills.Unlocks[newLevel] then
            Framework.Notify(source, Locale['unlock_available'], 'info')
        end
    end
    
    -- Update database
    MySQL.Async.execute('UPDATE lxr_woodwork_skills SET ' .. skillName .. ' = ?, ' .. skillName .. '_xp = ? WHERE player_identifier = ?', {
        newLevel,
        newXP,
        identifier
    })
    
    -- Notify client
    TriggerClientEvent('lxr-woodwork:client:skillUpdated', source, skillName, newLevel, newXP)
    
    return true
end

-- Get skill level
RegisterNetEvent('lxr-woodwork:server:getSkills', function()
    local source = source
    local identifier = Framework.GetIdentifier(source)
    local skills = GetPlayerSkills(identifier)
    TriggerClientEvent('lxr-woodwork:client:receiveSkills', source, skills)
end)

-- Increase stat counters
function IncreaseStat(identifier, statName, amount)
    amount = amount or 1
    MySQL.Async.execute('UPDATE lxr_woodwork_skills SET ' .. statName .. ' = ' .. statName .. ' + ? WHERE player_identifier = ?', {
        amount,
        identifier
    })
end

-- Tree cut handler
RegisterNetEvent('lxr-woodwork:server:treeCut', function(treeId, treeType)
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    -- Add XP
    local treeConfig = Config.Trees.Types[treeType]
    if treeConfig then
        AddSkillXP(source, 'felling', treeConfig.xpReward)
        IncreaseStat(identifier, 'total_trees_cut', 1)
    end
end)

-- Processing handler
RegisterNetEvent('lxr-woodwork:server:itemProcessed', function(recipeType, itemName)
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    -- Determine skill type and XP
    local xpAmount = 0
    local skillType = nil
    
    if Config.Processing.Sawmill[itemName] then
        skillType = 'milling'
        xpAmount = Config.Processing.Sawmill[itemName].xpReward
        IncreaseStat(identifier, 'total_planks_made', 1)
    elseif Config.Processing.Carpenter[itemName] then
        skillType = 'carpentry'
        xpAmount = Config.Processing.Carpenter[itemName].xpReward
    elseif Config.Processing.Kiln[itemName] then
        skillType = 'milling'
        xpAmount = Config.Processing.Kiln[itemName].xpReward
    elseif Config.Processing.PitchBoiler[itemName] then
        skillType = 'milling'
        xpAmount = Config.Processing.PitchBoiler[itemName].xpReward
    end
    
    if skillType and xpAmount > 0 then
        AddSkillXP(source, skillType, xpAmount)
    end
end)

-- Delivery handler
RegisterNetEvent('lxr-woodwork:server:deliveryComplete', function(missionId, distance)
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    -- Calculate XP based on distance
    local xpAmount = math.floor(distance / 100) + 20 -- Base 20 XP + distance bonus
    AddSkillXP(source, 'logistics', xpAmount)
    IncreaseStat(identifier, 'total_deliveries', 1)
end)

-- Management actions
RegisterNetEvent('lxr-woodwork:server:managementAction', function(actionType)
    local source = source
    
    local xpAmount = 0
    if actionType == 'hire_employee' then
        xpAmount = Config.Skills.Management.activities.hirEmployee or 10
    elseif actionType == 'complete_contract' then
        xpAmount = Config.Skills.Management.activities.completeContract or 15
    elseif actionType == 'sell_products' then
        xpAmount = Config.Skills.Management.activities.sellProducts or 5
    end
    
    if xpAmount > 0 then
        AddSkillXP(source, 'management', xpAmount)
    end
end)

-- Export functions
exports('GetPlayerSkills', GetPlayerSkills)
exports('AddSkillXP', AddSkillXP)
exports('GetPlayerSkill', function(playerId, skillName)
    local identifier = Framework.GetIdentifier(playerId)
    if not identifier then return 0 end
    local skills = GetPlayerSkills(identifier)
    return skills and skills[skillName] or 0
end)
