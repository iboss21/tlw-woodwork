-- Inventory system server-side logic

-- Add item to inventory
function AddInventoryItem(ownerType, ownerId, itemName, amount, quality, metadata)
    quality = quality or 'fresh'
    metadata = metadata and json.encode(metadata) or nil
    
    -- Check if item already exists
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_inventory WHERE owner_type = ? AND owner_id = ? AND item_name = ? AND quality = ?', {
        ownerType, ownerId, itemName, quality
    }, function(result)
        if result and result[1] then
            -- Update existing
            local newAmount = result[1].amount + amount
            MySQL.Async.execute('UPDATE lxr_woodwork_inventory SET amount = ? WHERE id = ?', {newAmount, result[1].id})
        else
            -- Insert new
            MySQL.Async.execute('INSERT INTO lxr_woodwork_inventory (owner_type, owner_id, item_name, amount, quality, metadata) VALUES (?, ?, ?, ?, ?, ?)', {
                ownerType, ownerId, itemName, amount, quality, metadata
            })
        end
    end)
    
    return true
end

-- Remove item from inventory
function RemoveInventoryItem(ownerType, ownerId, itemName, amount, quality)
    quality = quality or 'fresh'
    
    local p = promise.new()
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_inventory WHERE owner_type = ? AND owner_id = ? AND item_name = ? AND quality = ?', {
        ownerType, ownerId, itemName, quality
    }, function(result)
        if result and result[1] then
            if result[1].amount >= amount then
                local newAmount = result[1].amount - amount
                if newAmount > 0 then
                    MySQL.Async.execute('UPDATE lxr_woodwork_inventory SET amount = ? WHERE id = ?', {newAmount, result[1].id})
                else
                    MySQL.Async.execute('DELETE FROM lxr_woodwork_inventory WHERE id = ?', {result[1].id})
                end
                p:resolve(true)
            else
                p:resolve(false)
            end
        else
            p:resolve(false)
        end
    end)
    
    return Citizen.Await(p)
end

-- Get inventory
function GetInventory(ownerType, ownerId)
    local p = promise.new()
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_inventory WHERE owner_type = ? AND owner_id = ?', {ownerType, ownerId}, function(result)
        p:resolve(result or {})
    end)
    return Citizen.Await(p)
end

-- Check if has item
function HasInventoryItem(ownerType, ownerId, itemName, amount, quality)
    quality = quality or 'fresh'
    local p = promise.new()
    
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_inventory WHERE owner_type = ? AND owner_id = ? AND item_name = ? AND quality = ?', {
        ownerType, ownerId, itemName, quality
    }, function(result)
        if result and result[1] then
            p:resolve(result[1].amount >= amount)
        else
            p:resolve(false)
        end
    end)
    
    return Citizen.Await(p)
end

-- Get player inventory
RegisterNetEvent('lxr-woodwork:server:getInventory', function()
    local source = source
    local identifier = Framework.GetIdentifier(source)
    local inventory = GetInventory('player', identifier)
    TriggerClientEvent('lxr-woodwork:client:receiveInventory', source, inventory)
end)

-- Transfer items
RegisterNetEvent('lxr-woodwork:server:transferItem', function(fromType, fromId, toType, toId, itemName, amount, quality)
    local source = source
    
    -- Verify ownership/permissions
    local identifier = Framework.GetIdentifier(source)
    if fromType == 'player' and fromId ~= identifier then
        Framework.Notify(source, 'No permission', 'error')
        return
    end
    
    -- Check if has item
    if not HasInventoryItem(fromType, fromId, itemName, amount, quality) then
        Framework.Notify(source, 'Not enough items', 'error')
        return
    end
    
    -- Remove from source
    if RemoveInventoryItem(fromType, fromId, itemName, amount, quality) then
        -- Add to destination
        AddInventoryItem(toType, toId, itemName, amount, quality)
        Framework.Notify(source, 'Items transferred', 'success')
    end
end)

-- Sell item to shop
RegisterNetEvent('lxr-woodwork:server:sellItem', function(shopName, itemName, amount, quality)
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    quality = quality or 'fresh'
    
    -- Get item config
    local itemConfig = Config.Materials.Raw[itemName] or 
                      Config.Materials.Processed[itemName] or 
                      Config.Materials.Refined[itemName] or 
                      Config.Materials.Byproducts[itemName]
    
    if not itemConfig or not itemConfig.sellable then
        Framework.Notify(source, 'This item cannot be sold', 'error')
        return
    end
    
    -- Check if player has item
    if not HasInventoryItem('player', identifier, itemName, amount, quality) then
        Framework.Notify(source, Locale['no_materials'], 'error')
        return
    end
    
    -- Get shop config
    local shopConfig = nil
    for _, shop in pairs(Config.Shops.Locations) do
        if shop.name == shopName then
            shopConfig = shop
            break
        end
    end
    
    if not shopConfig then
        Framework.Notify(source, 'Shop not found', 'error')
        return
    end
    
    -- Calculate price
    local basePrice = itemConfig.baseValue
    local qualityMultiplier = 1.0
    if quality and Config.Materials.QualityTiers[quality] then
        qualityMultiplier = Config.Materials.QualityTiers[quality].priceMultiplier
    end
    
    local totalPrice = math.floor(basePrice * amount * qualityMultiplier * shopConfig.sellPriceMultiplier)
    
    -- Remove item
    if RemoveInventoryItem('player', identifier, itemName, amount, quality) then
        -- Add money
        Framework.AddMoney(source, totalPrice, 'cash')
        Framework.Notify(source, string.format(Locale['item_sold'], amount, itemName, Utils.FormatMoney(totalPrice)), 'success')
        
        -- Update market supply
        TriggerEvent('lxr-woodwork:server:updateSupply', itemName, amount)
        
        -- Management XP
        TriggerEvent('lxr-woodwork:server:managementAction', 'sell_products')
    end
end)

-- Buy item from shop
RegisterNetEvent('lxr-woodwork:server:buyItem', function(shopName, itemName, amount)
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    -- Get item config
    local itemConfig = Config.Materials.Raw[itemName] or 
                      Config.Materials.Processed[itemName] or 
                      Config.Materials.Refined[itemName] or 
                      Config.Materials.Byproducts[itemName]
    
    if not itemConfig then
        Framework.Notify(source, 'Invalid item', 'error')
        return
    end
    
    -- Get shop config
    local shopConfig = nil
    for _, shop in pairs(Config.Shops.Locations) do
        if shop.name == shopName then
            shopConfig = shop
            break
        end
    end
    
    if not shopConfig then
        Framework.Notify(source, 'Shop not found', 'error')
        return
    end
    
    -- Calculate price
    local basePrice = itemConfig.baseValue
    local totalPrice = math.floor(basePrice * amount * shopConfig.buyPriceMultiplier)
    
    -- Check money
    if Framework.GetMoney(source, 'cash') < totalPrice then
        Framework.Notify(source, Locale['not_enough_money'], 'error')
        return
    end
    
    -- Remove money
    Framework.RemoveMoney(source, totalPrice, 'cash')
    
    -- Add item
    AddInventoryItem('player', identifier, itemName, amount, 'fresh')
    Framework.Notify(source, string.format(Locale['item_purchased'], amount, itemName, Utils.FormatMoney(totalPrice)), 'success')
    
    -- Update market demand
    TriggerEvent('lxr-woodwork:server:updateDemand', itemName, amount)
end)

-- Handle aging item placement
RegisterServerEvent('lxr-woodwork:server:agingComplete', function(campId, itemName, quality)
    -- Notify camp owner
    MySQL.Async.fetchAll('SELECT b.owner_identifier FROM lxr_woodwork_camps c JOIN lxr_woodwork_businesses b ON c.business_id = b.id WHERE c.id = ?', {campId}, function(result)
        if result and result[1] then
            -- Find player online
            for _, playerId in ipairs(GetPlayers()) do
                if Framework.GetIdentifier(playerId) == result[1].owner_identifier then
                    Framework.Notify(playerId, string.format(Locale['item_upgraded'], quality), 'success')
                    break
                end
            end
        end
    end)
end)

-- Add item from tree harvest
RegisterServerEvent('lxr-woodwork:server:addInventoryItem', function(ownerType, ownerId, itemName, amount, quality)
    AddInventoryItem(ownerType, ownerId, itemName, amount, quality)
end)

-- Export functions
exports('AddMaterial', AddInventoryItem)
exports('RemoveMaterial', RemoveInventoryItem)
exports('GetInventory', GetInventory)
exports('HasInventoryItem', HasInventoryItem)
