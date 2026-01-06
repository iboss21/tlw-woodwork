-- Framework detection and bridging for LXR-Woodwork

Framework = {}
Framework.Type = nil
Framework.Object = nil

-- Initialize framework
function Framework.Init()
    for _, frameworkName in ipairs(Config.FrameworkPriority) do
        if frameworkName == 'lxr-core' then
            local success, core = pcall(function() return exports['lxr-core']:GetCoreObject() end)
            if success and core then
                Framework.Type = 'lxr-core'
                Framework.Object = core
                if Config.Debug then print('[LXR-Woodwork] Detected lxr-core framework') end
                return true
            end
        elseif frameworkName == 'rsg-core' then
            local success, core = pcall(function() return exports['rsg-core']:GetCoreObject() end)
            if success and core then
                Framework.Type = 'rsg-core'
                Framework.Object = core
                if Config.Debug then print('[LXR-Woodwork] Detected rsg-core framework') end
                return true
            end
        elseif frameworkName == 'qb-core' then
            local success, core = pcall(function() return exports['qb-core']:GetCoreObject() end)
            if success and core then
                Framework.Type = 'qb-core'
                Framework.Object = core
                if Config.Debug then print('[LXR-Woodwork] Detected qb-core framework') end
                return true
            end
        elseif frameworkName == 'esx' then
            local success, core = pcall(function() return exports['es_extended']:getSharedObject() end)
            if success and core then
                Framework.Type = 'esx'
                Framework.Object = core
                if Config.Debug then print('[LXR-Woodwork] Detected ESX framework') end
                return true
            end
        elseif frameworkName == 'standalone' then
            Framework.Type = 'standalone'
            Framework.Object = nil
            if Config.Debug then print('[LXR-Woodwork] Running in standalone mode') end
            return true
        end
    end
    
    -- Default to standalone if nothing found
    Framework.Type = 'standalone'
    Framework.Object = nil
    if Config.Debug then print('[LXR-Woodwork] No framework detected, running standalone') end
    return false
end

-- Get player data
function Framework.GetPlayer(source)
    if Framework.Type == 'lxr-core' or Framework.Type == 'rsg-core' or Framework.Type == 'qb-core' then
        return Framework.Object.Functions.GetPlayer(source)
    elseif Framework.Type == 'esx' then
        return Framework.Object.GetPlayerFromId(source)
    elseif Framework.Type == 'standalone' then
        return {
            PlayerData = {
                citizenid = tostring(source),
                source = source,
                name = GetPlayerName(source)
            }
        }
    end
    return nil
end

-- Get player identifier
function Framework.GetIdentifier(source)
    if Framework.Type == 'lxr-core' or Framework.Type == 'rsg-core' or Framework.Type == 'qb-core' then
        local Player = Framework.GetPlayer(source)
        return Player and Player.PlayerData.citizenid or nil
    elseif Framework.Type == 'esx' then
        local Player = Framework.GetPlayer(source)
        return Player and Player.identifier or nil
    elseif Framework.Type == 'standalone' then
        return tostring(source)
    end
    return nil
end

-- Add money
function Framework.AddMoney(source, amount, moneyType)
    moneyType = moneyType or 'cash'
    
    if Framework.Type == 'lxr-core' or Framework.Type == 'rsg-core' or Framework.Type == 'qb-core' then
        local Player = Framework.GetPlayer(source)
        if Player then
            Player.Functions.AddMoney(moneyType, amount)
            return true
        end
    elseif Framework.Type == 'esx' then
        local Player = Framework.GetPlayer(source)
        if Player then
            if moneyType == 'cash' then
                Player.addMoney(amount)
            elseif moneyType == 'bank' then
                Player.addAccountMoney('bank', amount)
            end
            return true
        end
    elseif Framework.Type == 'standalone' then
        -- Standalone money handling would need custom implementation
        return true
    end
    return false
end

-- Remove money
function Framework.RemoveMoney(source, amount, moneyType)
    moneyType = moneyType or 'cash'
    
    if Framework.Type == 'lxr-core' or Framework.Type == 'rsg-core' or Framework.Type == 'qb-core' then
        local Player = Framework.GetPlayer(source)
        if Player then
            Player.Functions.RemoveMoney(moneyType, amount)
            return true
        end
    elseif Framework.Type == 'esx' then
        local Player = Framework.GetPlayer(source)
        if Player then
            if moneyType == 'cash' then
                Player.removeMoney(amount)
            elseif moneyType == 'bank' then
                Player.removeAccountMoney('bank', amount)
            end
            return true
        end
    elseif Framework.Type == 'standalone' then
        return true
    end
    return false
end

-- Get player money
function Framework.GetMoney(source, moneyType)
    moneyType = moneyType or 'cash'
    
    if Framework.Type == 'lxr-core' or Framework.Type == 'rsg-core' or Framework.Type == 'qb-core' then
        local Player = Framework.GetPlayer(source)
        if Player then
            return Player.PlayerData.money[moneyType] or 0
        end
    elseif Framework.Type == 'esx' then
        local Player = Framework.GetPlayer(source)
        if Player then
            if moneyType == 'cash' then
                return Player.getMoney()
            elseif moneyType == 'bank' then
                return Player.getAccount('bank').money
            end
        end
    elseif Framework.Type == 'standalone' then
        return 99999 -- Placeholder
    end
    return 0
end

-- Show notification
function Framework.Notify(source, message, type, duration)
    type = type or 'info'
    duration = duration or 5000
    
    if Framework.Type == 'lxr-core' or Framework.Type == 'rsg-core' or Framework.Type == 'qb-core' then
        TriggerClientEvent('Framework.Object:Notify', source, message, type, duration)
    elseif Framework.Type == 'esx' then
        TriggerClientEvent('esx:showNotification', source, message)
    elseif Framework.Type == 'standalone' then
        TriggerClientEvent('chat:addMessage', source, {
            args = {'[Woodwork]', message}
        })
    end
end

-- Initialize on resource start
Citizen.CreateThread(function()
    Framework.Init()
end)

return Framework
