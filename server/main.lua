-- Server initialization for LXR-Woodwork

-- Load locales
local currentLocale = Config.Locale or 'en'
Locale = {}

if GetResourceState('locales') == 'started' then
    Locale = exports.locales:GetLocale(currentLocale)
else
    -- Load from local files
    local localeFile = LoadResourceFile(GetCurrentResourceName(), 'locales/' .. currentLocale .. '.lua')
    if localeFile then
        local localeFunc = load(localeFile)
        if localeFunc then
            local result = localeFunc()
            if result and result[currentLocale] then
                Locale = result[currentLocale]
            end
        end
    end
end

-- Initialize framework
if not Framework then
    Framework = {}
end
Framework.Init()

print('^2[LXR-Woodwork]^7 Resource starting...')
print('^2[LXR-Woodwork]^7 Framework: ' .. (Framework.Type or 'Unknown'))
print('^2[LXR-Woodwork]^7 Locale: ' .. currentLocale)

-- Initialize database tables
local function InitializeDatabase()
    if Config.UseOxMySQL then
        local schemaFile = LoadResourceFile(GetCurrentResourceName(), 'sql/install.sql')
        if schemaFile then
            -- Split by statement (basic implementation)
            for statement in schemaFile:gmatch("CREATE TABLE[^;]+;") do
                MySQL.Async.execute(statement, {}, function(result)
                    if Config.Debug then
                        print('[LXR-Woodwork] Database table created/verified')
                    end
                end)
            end
            print('^2[LXR-Woodwork]^7 Database initialized')
        else
            print('^1[LXR-Woodwork]^7 Failed to load database schema file')
        end
    end
end

-- Initialize market prices
local function InitializeMarket()
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_market', {}, function(result)
        if not result or #result == 0 then
            -- Insert default prices for all materials
            for category, materials in pairs(Config.Materials) do
                if type(materials) == 'table' then
                    for itemName, itemData in pairs(materials) do
                        if itemData.baseValue then
                            MySQL.Async.execute('INSERT INTO lxr_woodwork_market (material_name, base_price, current_price, supply_level, demand_level) VALUES (?, ?, ?, ?, ?)', {
                                itemName,
                                itemData.baseValue,
                                itemData.baseValue,
                                50,
                                50
                            })
                        end
                    end
                end
            end
            if Config.Debug then
                print('[LXR-Woodwork] Market prices initialized')
            end
        end
    end)
end

-- Initialize trees
local function InitializeTrees()
    MySQL.Async.fetchAll('SELECT COUNT(*) as count FROM lxr_woodwork_trees', {}, function(result)
        local treeCount = result[1] and result[1].count or 0
        if treeCount < 100 then
            -- Spawn initial trees in zones
            for _, zone in ipairs(Config.Trees.SpawnZones) do
                local treesToSpawn = math.min(zone.maxTrees, 50) -- Spawn in batches
                for i = 1, treesToSpawn do
                    local treeType = zone.types[math.random(1, #zone.types)]
                    local angle = math.random() * 2 * math.pi
                    local distance = math.random() * zone.radius
                    local x = zone.center.x + distance * math.cos(angle)
                    local y = zone.center.y + distance * math.sin(angle)
                    local z = zone.center.z
                    
                    MySQL.Async.execute('INSERT INTO lxr_woodwork_trees (tree_type, coords_x, coords_y, coords_z, zone, state, health) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                        treeType,
                        x,
                        y,
                        z,
                        zone.region,
                        'healthy',
                        100
                    })
                end
            end
            if Config.Debug then
                print('[LXR-Woodwork] Trees initialized')
            end
        end
    end)
end

-- Start resource
Citizen.CreateThread(function()
    Wait(1000) -- Wait for other resources to load
    InitializeDatabase()
    Wait(2000) -- Wait for database
    InitializeMarket()
    InitializeTrees()
    print('^2[LXR-Woodwork]^7 Resource started successfully!')
end)

-- Periodic updates
Citizen.CreateThread(function()
    while true do
        Wait(Config.PriceUpdateInterval * 1000)
        if Config.EnableDynamicPricing then
            TriggerEvent('lxr-woodwork:server:updateMarketPrices')
        end
    end
end)

-- Tree respawn thread
Citizen.CreateThread(function()
    while true do
        Wait(60000) -- Check every minute
        MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_trees WHERE state = ? AND respawn_at <= NOW()', {'respawning'}, function(trees)
            for _, tree in ipairs(trees) do
                MySQL.Async.execute('UPDATE lxr_woodwork_trees SET state = ?, health = ? WHERE id = ?', {
                    'healthy',
                    100,
                    tree.id
                })
                TriggerClientEvent('lxr-woodwork:client:treeRespawned', -1, tree.id)
            end
        end)
    end
end)

-- Aging items check
Citizen.CreateThread(function()
    while true do
        Wait(Config.Processing.DryingShed.checkInterval * 1000)
        MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_aging WHERE next_upgrade_at <= NOW()', {}, function(items)
            for _, item in ipairs(items) do
                local currentQuality = item.current_quality
                local nextQuality = nil
                
                -- Find next quality tier
                for _, progression in ipairs(Config.Processing.DryingShed.qualityProgression) do
                    if progression.from == currentQuality then
                        nextQuality = progression.to
                        break
                    end
                end
                
                if nextQuality then
                    -- Update quality
                    MySQL.Async.execute('UPDATE lxr_woodwork_aging SET current_quality = ?, next_upgrade_at = DATE_ADD(NOW(), INTERVAL ? SECOND) WHERE id = ?', {
                        nextQuality,
                        Config.Processing.DryingShed.qualityProgression[1].time, -- Use first tier time as default
                        item.id
                    })
                    
                    -- Notify camp owner
                    TriggerEvent('lxr-woodwork:server:agingComplete', item.camp_id, item.item_name, nextQuality)
                else
                    -- Max quality reached, move to inventory
                    MySQL.Async.execute('DELETE FROM lxr_woodwork_aging WHERE id = ?', {item.id})
                    TriggerEvent('lxr-woodwork:server:addInventoryItem', 'camp', tostring(item.camp_id), item.item_name, item.amount, item.current_quality)
                end
            end
        end)
    end
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print('^3[LXR-Woodwork]^7 Resource stopped')
    end
end)
