-- Business management server-side logic

-- Get business data
function GetBusinessData(businessId)
    local p = promise.new()
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_businesses WHERE id = ?', {businessId}, function(result)
        if result and result[1] then
            p:resolve(result[1])
        else
            p:resolve(nil)
        end
    end)
    return Citizen.Await(p)
end

-- Create new business
RegisterNetEvent('lxr-woodwork:server:purchaseLicense', function(licenseType, businessName)
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    if not identifier then
        Framework.Notify(source, 'Error getting player data', 'error')
        return
    end
    
    local licenseData = Config.Businesses.LicenseTiers[licenseType]
    if not licenseData then
        Framework.Notify(source, 'Invalid license type', 'error')
        return
    end
    
    -- Check if player already owns a business
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_businesses WHERE owner_identifier = ?', {identifier}, function(result)
        if result and #result > 0 then
            Framework.Notify(source, Locale['already_own_business'], 'error')
            return
        end
        
        -- Check if player has enough money
        local playerMoney = Framework.GetMoney(source, 'cash')
        if playerMoney < licenseData.cost then
            Framework.Notify(source, Locale['cant_afford_license'], 'error')
            return
        end
        
        -- Check skill level
        MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_skills WHERE player_identifier = ?', {identifier}, function(skillResult)
            local managementLevel = 0
            if skillResult and skillResult[1] then
                managementLevel = skillResult[1].management or 0
            end
            
            if managementLevel < licenseData.requiredLevel then
                Framework.Notify(source, Locale['not_enough_skill'], 'error')
                return
            end
            
            -- Remove money
            Framework.RemoveMoney(source, licenseData.cost, 'cash')
            
            -- Create business
            MySQL.Async.execute('INSERT INTO lxr_woodwork_businesses (owner_identifier, license_type, business_name, bank_balance) VALUES (?, ?, ?, ?)', {
                identifier,
                licenseType,
                businessName,
                0
            }, function(insertId)
                Framework.Notify(source, Locale['business_created'], 'success')
                TriggerClientEvent('lxr-woodwork:client:businessCreated', source, insertId)
            end)
        end)
    end)
end)

-- Get player businesses
RegisterNetEvent('lxr-woodwork:server:getBusinesses', function()
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_businesses WHERE owner_identifier = ?', {identifier}, function(result)
        TriggerClientEvent('lxr-woodwork:client:receiveBusinesses', source, result)
    end)
end)

-- Update business bank balance
function UpdateBusinessBalance(businessId, amount, transactionType, description)
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_businesses WHERE id = ?', {businessId}, function(result)
        if result and result[1] then
            local newBalance = result[1].bank_balance + amount
            MySQL.Async.execute('UPDATE lxr_woodwork_businesses SET bank_balance = ? WHERE id = ?', {newBalance, businessId})
            
            -- Record transaction
            MySQL.Async.execute('INSERT INTO lxr_woodwork_transactions (business_id, transaction_type, amount, description) VALUES (?, ?, ?, ?)', {
                businessId,
                transactionType,
                math.abs(amount),
                description
            })
            
            -- Update totals
            if transactionType == 'income' then
                MySQL.Async.execute('UPDATE lxr_woodwork_businesses SET total_revenue = total_revenue + ? WHERE id = ?', {math.abs(amount), businessId})
            else
                MySQL.Async.execute('UPDATE lxr_woodwork_businesses SET total_expenses = total_expenses + ? WHERE id = ?', {math.abs(amount), businessId})
            end
        end
    end)
end

-- Deposit to business bank
RegisterNetEvent('lxr-woodwork:server:depositBusiness', function(businessId, amount)
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_businesses WHERE id = ? AND owner_identifier = ?', {businessId, identifier}, function(result)
        if not result or #result == 0 then
            Framework.Notify(source, Locale['not_owner'], 'error')
            return
        end
        
        if Framework.GetMoney(source, 'cash') < amount then
            Framework.Notify(source, Locale['not_enough_money'], 'error')
            return
        end
        
        Framework.RemoveMoney(source, amount, 'cash')
        UpdateBusinessBalance(businessId, amount, 'income', 'Owner deposit')
        Framework.Notify(source, 'Deposited ' .. Utils.FormatMoney(amount), 'success')
    end)
end)

-- Withdraw from business bank
RegisterNetEvent('lxr-woodwork:server:withdrawBusiness', function(businessId, amount)
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_businesses WHERE id = ? AND owner_identifier = ?', {businessId, identifier}, function(result)
        if not result or #result == 0 then
            Framework.Notify(source, Locale['not_owner'], 'error')
            return
        end
        
        if result[1].bank_balance < amount then
            Framework.Notify(source, 'Insufficient business funds', 'error')
            return
        end
        
        UpdateBusinessBalance(businessId, -amount, 'expense', 'Owner withdrawal')
        Framework.AddMoney(source, amount, 'cash')
        Framework.Notify(source, 'Withdrew ' .. Utils.FormatMoney(amount), 'success')
    end)
end)

-- Daily business costs
Citizen.CreateThread(function()
    while true do
        Wait(86400000) -- 24 hours
        
        MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_businesses WHERE abandoned = 0', {}, function(businesses)
            for _, business in ipairs(businesses) do
                local dailyCost = Config.Businesses.Management.dailyOperatingCosts[business.license_type] or 0
                
                -- Add NPC wages
                MySQL.Async.fetchAll('SELECT SUM(wage) as total_wages FROM lxr_woodwork_npcs WHERE camp_id IN (SELECT id FROM lxr_woodwork_camps WHERE business_id = ?)', {business.id}, function(wageResult)
                    local npcWages = (wageResult and wageResult[1] and wageResult[1].total_wages) or 0
                    dailyCost = dailyCost + npcWages
                    
                    -- Deduct from business balance
                    UpdateBusinessBalance(business.id, -dailyCost, 'expense', 'Daily operating costs')
                    
                    -- Check for bankruptcy
                    if business.bank_balance - dailyCost <= Config.Businesses.Banking.bankruptcyThreshold then
                        -- Trigger bankruptcy
                        TriggerEvent('lxr-woodwork:server:bankruptcy', business.id)
                    end
                end)
            end
        end)
    end
end)

-- Bankruptcy handler
RegisterServerEvent('lxr-woodwork:server:bankruptcy', function(businessId)
    if Config.EnableBankruptcy then
        MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_businesses WHERE id = ?', {businessId}, function(result)
            if result and result[1] then
                -- Apply penalty
                local penaltyMultiplier = 1 - Config.BankruptcyPenalty
                
                -- Reduce inventory
                MySQL.Async.execute('UPDATE lxr_woodwork_inventory SET amount = FLOOR(amount * ?) WHERE owner_type = ? AND owner_id = ?', {
                    penaltyMultiplier,
                    'business',
                    tostring(businessId)
                })
                
                -- Reset balance
                MySQL.Async.execute('UPDATE lxr_woodwork_businesses SET bank_balance = 0 WHERE id = ?', {businessId})
                
                -- Notify owner
                local owner = result[1].owner_identifier
                -- Get player source from identifier
                for _, playerId in ipairs(GetPlayers()) do
                    if Framework.GetIdentifier(playerId) == owner then
                        Framework.Notify(playerId, 'Your business has declared bankruptcy!', 'error')
                        break
                    end
                end
            end
        end)
    end
end)

-- Pack up camp
RegisterNetEvent('lxr-woodwork:server:packUpCamp', function(campId)
    local source = source
    local identifier = Framework.GetIdentifier(source)
    
    MySQL.Async.fetchAll('SELECT c.*, b.owner_identifier FROM lxr_woodwork_camps c JOIN lxr_woodwork_businesses b ON c.business_id = b.id WHERE c.id = ?', {campId}, function(result)
        if not result or #result == 0 then
            Framework.Notify(source, 'Camp not found', 'error')
            return
        end
        
        if result[1].owner_identifier ~= identifier then
            Framework.Notify(source, Locale['not_owner'], 'error')
            return
        end
        
        -- Calculate refund
        local refundAmount = 0
        MySQL.Async.fetchAll('SELECT * FROM lxr_woodwork_structures WHERE camp_id = ?', {campId}, function(structures)
            for _, structure in ipairs(structures) do
                local structureConfig = Config.Structures.Core[structure.structure_type] or
                                       Config.Structures.Production[structure.structure_type] or
                                       Config.Structures.Utility[structure.structure_type]
                if structureConfig then
                    refundAmount = refundAmount + (structureConfig.cost * Config.Businesses.PackUp.refundPercentage)
                end
            end
            
            -- Delete structures
            MySQL.Async.execute('DELETE FROM lxr_woodwork_structures WHERE camp_id = ?', {campId})
            
            -- Delete NPCs
            MySQL.Async.execute('DELETE FROM lxr_woodwork_npcs WHERE camp_id = ?', {campId})
            
            -- Delete camp
            MySQL.Async.execute('DELETE FROM lxr_woodwork_camps WHERE id = ?', {campId})
            
            -- Refund money to business
            UpdateBusinessBalance(result[1].business_id, refundAmount, 'income', 'Camp pack up refund')
            
            Framework.Notify(source, Locale['camp_packed_up'], 'success')
            TriggerClientEvent('lxr-woodwork:client:campRemoved', -1, campId)
        end)
    end)
end)

-- Export functions
exports('GetBusinessData', GetBusinessData)
exports('UpdateBusinessBalance', UpdateBusinessBalance)
