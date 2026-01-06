-- Shared utility functions for LXR-Woodwork

Utils = {}

-- Round number to specified decimal places
function Utils.Round(num, decimals)
    local mult = 10^(decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Calculate distance between two vectors
function Utils.GetDistance(coords1, coords2)
    if type(coords1) == "table" and coords1.x then
        coords1 = vector3(coords1.x, coords1.y, coords1.z)
    end
    if type(coords2) == "table" and coords2.x then
        coords2 = vector3(coords2.x, coords2.y, coords2.z)
    end
    return #(coords1 - coords2)
end

-- Format money
function Utils.FormatMoney(amount)
    return "$" .. string.format("%.2f", amount)
end

-- Format time (seconds to readable format)
function Utils.FormatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60
    
    if hours > 0 then
        return string.format("%dh %dm %ds", hours, minutes, secs)
    elseif minutes > 0 then
        return string.format("%dm %ds", minutes, secs)
    else
        return string.format("%ds", secs)
    end
end

-- Check if player has required skill level
function Utils.HasRequiredSkill(playerSkills, skillName, requiredLevel)
    if not playerSkills or not playerSkills[skillName] then
        return false
    end
    return playerSkills[skillName] >= requiredLevel
end

-- Calculate XP required for next level
function Utils.GetXPForLevel(level)
    return Config.Skills.XPRequirements.baseXP * level * Config.Skills.XPRequirements.multiplier
end

-- Get skill level from XP
function Utils.GetLevelFromXP(xp, currentLevel)
    local totalXP = 0
    for level = 1, Config.Skills.XPRequirements.maxLevel do
        totalXP = totalXP + Utils.GetXPForLevel(level)
        if xp < totalXP then
            return level - 1
        end
    end
    return Config.Skills.XPRequirements.maxLevel
end

-- Get skill title from level
function Utils.GetSkillTitle(level)
    for _, range in ipairs(Config.Skills.LevelRanges) do
        if level >= range.min and level <= range.max then
            return range.title, range.color
        end
    end
    return "Unknown", "^7"
end

-- Check if coords are within zone
function Utils.IsInZone(coords, zoneCenter, zoneRadius)
    return Utils.GetDistance(coords, zoneCenter) <= zoneRadius
end

-- Get closest zone to coords
function Utils.GetClosestZone(coords, zones)
    local closestZone = nil
    local closestDistance = math.huge
    
    for _, zone in ipairs(zones) do
        local distance = Utils.GetDistance(coords, zone.center)
        if distance < closestDistance then
            closestDistance = distance
            closestZone = zone
        end
    end
    
    return closestZone, closestDistance
end

-- Check if terrain is flat enough
function Utils.IsTerrainFlat(coords, maxAngle)
    -- This would use native functions to check terrain angle
    -- Placeholder implementation
    return true
end

-- Generate unique ID
function Utils.GenerateID(prefix)
    local timestamp = os.time()
    local random = math.random(1000, 9999)
    return (prefix or "ID") .. "_" .. timestamp .. "_" .. random
end

-- Deep copy table
function Utils.DeepCopy(original)
    local copy
    if type(original) == 'table' then
        copy = {}
        for key, value in next, original, nil do
            copy[Utils.DeepCopy(key)] = Utils.DeepCopy(value)
        end
        setmetatable(copy, Utils.DeepCopy(getmetatable(original)))
    else
        copy = original
    end
    return copy
end

-- Check if table contains value
function Utils.TableContains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Get random element from table
function Utils.GetRandomFromTable(table)
    if #table == 0 then return nil end
    return table[math.random(1, #table)]
end

-- Calculate processing time with modifiers
function Utils.GetProcessingTime(baseTime, speedMultiplier, skillBonus)
    local time = baseTime / (speedMultiplier or 1.0)
    if skillBonus then
        time = time * (1 - skillBonus)
    end
    return math.max(1, Utils.Round(time, 0))
end

-- Calculate yield with bonuses
function Utils.CalculateYield(baseYield, toolBonus, skillBonus, qualityMultiplier)
    local yield = baseYield
    if toolBonus then
        yield = yield * (1 + toolBonus)
    end
    if skillBonus then
        yield = yield * (1 + skillBonus)
    end
    if qualityMultiplier then
        yield = yield * qualityMultiplier
    end
    return math.floor(yield)
end

-- Calculate price with market modifiers
function Utils.CalculatePrice(basePrice, supplyDemand, qualityMultiplier, shopMultiplier)
    local price = basePrice
    if supplyDemand then
        price = price * supplyDemand
    end
    if qualityMultiplier then
        price = price * qualityMultiplier
    end
    if shopMultiplier then
        price = price * shopMultiplier
    end
    return Utils.Round(price, 2)
end

-- Validate structure placement
function Utils.CanPlaceStructure(coords, structureType, campData)
    local structure = Config.Structures.Core[structureType] or 
                     Config.Structures.Production[structureType] or 
                     Config.Structures.Utility[structureType]
    
    if not structure then return false, "Invalid structure type" end
    
    -- Check distance from camp center
    if campData and campData.center then
        local distance = Utils.GetDistance(coords, campData.center)
        if distance > Config.Structures.PlacementRules.maxCampRadius then
            return false, "Too far from camp center"
        end
    end
    
    -- Check terrain
    if structure.flatTerrainRequired then
        if not Utils.IsTerrainFlat(coords, Config.Structures.PlacementRules.flatTerrainAngle) then
            return false, "Terrain not flat enough"
        end
    end
    
    -- Check spacing from other structures
    if campData and campData.structures then
        for _, existingStructure in ipairs(campData.structures) do
            local distance = Utils.GetDistance(coords, existingStructure.coords)
            if distance < Config.Structures.PlacementRules.minSpacing then
                return false, "Too close to another structure"
            end
        end
    end
    
    return true
end

-- Get weather speed modifier
function Utils.GetWeatherModifier()
    -- This would integrate with weather script
    -- Placeholder returning normal weather
    return 1.0
end

-- Calculate stamina drain
function Utils.CalculateStaminaDrain(baseStamina, toolModifier, skillReduction)
    local drain = baseStamina
    if toolModifier then
        drain = drain * toolModifier
    end
    if skillReduction then
        drain = drain * (1 - skillReduction)
    end
    return math.max(1, Utils.Round(drain, 0))
end

-- Format large numbers
function Utils.FormatNumber(number)
    if number >= 1000000 then
        return string.format("%.1fM", number / 1000000)
    elseif number >= 1000 then
        return string.format("%.1fK", number / 1000)
    else
        return tostring(number)
    end
end

-- Get material display name with quality
function Utils.GetMaterialDisplayName(materialName, quality)
    local material = Config.Materials.Raw[materialName] or 
                    Config.Materials.Processed[materialName] or 
                    Config.Materials.Refined[materialName] or 
                    Config.Materials.Byproducts[materialName]
    
    if not material then return materialName end
    
    local displayName = material.name
    if quality and quality ~= 'fresh' and Config.Materials.QualityTiers[quality] then
        local qualityData = Config.Materials.QualityTiers[quality]
        displayName = qualityData.color .. qualityData.name .. " " .. displayName .. "^7"
    end
    
    return displayName
end

return Utils
