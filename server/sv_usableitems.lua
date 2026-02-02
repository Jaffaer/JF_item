local QBCore = nil
local isQBX = GetResourceState('qbx_core') == 'started'

if not isQBX then
    QBCore = exports['qb-core']:GetCoreObject()
end

local serverInventory = 'ox_inventory'

local function HasItem(source, item, amount)
    if isQBX then
        local Player = exports.qbx_core:GetPlayer(source)
        if not Player then return false end
        local itemData = Player.Functions.GetItemByName(item)
        return itemData and itemData.amount >= amount
    else
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player then return false end
        local itemData = Player.Functions.GetItemByName(item)
        return itemData and itemData.amount >= amount
    end
end

local function RemoveItem(source, item, amount, metadata)
    if serverInventory == 'ox_inventory' then
        return exports.ox_inventory:RemoveItem(source, item, amount, metadata)
    else
        if isQBX then
            local Player = exports.qbx_core:GetPlayer(source)
            if not Player then return false end
            return Player.Functions.RemoveItem(item, amount)
        else
            local Player = QBCore.Functions.GetPlayer(source)
            if not Player then return false end
            return Player.Functions.RemoveItem(item, amount)
        end
    end
end

local function CreateUsableItem(item, callback)
    if isQBX then
        exports.qbx_core:CreateUseableItem(item, callback)
    else
        QBCore.Functions.CreateUseableItem(item, callback)
    end
end

local getMetadata = function(itemData)
    if not itemData then return nil end
    if serverInventory == 'ox_inventory' then
        return itemData.metadata or nil
    else
        return itemData.info or nil
    end
end

if serverInventory == 'ox_inventory' then
    exports('useSeed', function(event, item, inventory, slot, data)
        if Config.Debug then lib.print.info('useSeed', item) end
        local plant = item.name

        if event == 'usingItem' then
            local src = inventory.id
            if HasItem(src, plant, 1) then
                local metadata = nil
                if Config.Debug then lib.print.info('Plant metadata', metadata) end
                TriggerClientEvent('jffm:client:useSeed', src, plant, metadata)
            else
                if Config.Debug then lib.print.error('Failed to use seed', src, HasItem(src, plant, 1)) end
            end
        end
    end)

    if Config.EnableProcessing then
        exports('placeProcessingTable', function(event, item, inventory, slot, data)
            if Config.Debug then lib.print.info('placeProcessingTable', item) end

            local prTable = item.name
            if event == 'usingItem' then
                local src = inventory.id
                if HasItem(src, prTable, 1) then
                    local metadata = getMetadata(prTable)
                    if Config.Debug then lib.print.info('Table metadata', metadata) end
                    TriggerClientEvent('jffm:client:placeProcessingTable', src, prTable, metadata)
                end
            end
        end)
    end

    if Config.EnableDrugs then
        exports('takeDrug', function(event, item, inventory, slot, data)
            if Config.Debug then lib.print.info('takeDrug', item) end

            local drug = item.name
            if event == 'usingItem' then
                local src = inventory.id
                local currentDrug = lib.callback.await('jffm:client:getCurrentDrugEffect', src)
                if Config.Debug then lib.print.info('currentDrug', currentDrug) end
                if not currentDrug then
                    local isDrugOnCooldown = lib.callback.await('jffm:client:isDrugOnCooldown', src, drug)
                    if isDrugOnCooldown then
                        ShowNotification(src, _U('NOTIFICATION__DRUG__COOLDOWN'), "info")
                        return
                    end

                    TriggerClientEvent('jffm:client:takeDrug', src, drug)
                    exports.ox_inventory:RemoveItem(src, item, 1, nil, slot)
                else
                    ShowNotification(src, _U('NOTIFICATION__DRUG__ALREADY'), "info")
                end
            end
        end)
    end
else
    for plant, _ in pairs(Config.Plants) do
        CreateUsableItem(plant, function(source, data)
            local src = source
            if HasItem(src, plant, 1) then
                local metadata = getMetadata(data)
                if Config.Debug then lib.print.info('Plant metadata', metadata) end
                TriggerClientEvent('jffm:client:useSeed', src, plant, metadata)
            end
        end)
    end

    if Config.EnableProcessing then
        for prTable, _ in pairs(Config.ProcessingTables) do
            CreateUsableItem(prTable, function(source, data)
                local src = source
                if HasItem(src, prTable, 1) then
                    local metadata = getMetadata(data)
                    if Config.Debug then lib.print.info('Table metadata', metadata) end
                    TriggerClientEvent('jffm:client:placeProcessingTable', src, prTable, metadata)
                end
            end)
        end
    end

    if Config.EnableDrugs then
        for drug, _ in pairs(Config.Drugs) do
            CreateUsableItem(drug, function(source, data)
                local src = source
                if HasItem(src, drug, 1) then
                    local currentDrug = lib.callback.await('jffm:client:getCurrentDrugEffect', src)
                    if Config.Debug then lib.print.info('currentDrug', currentDrug) end
                    if not currentDrug then
                        local isDrugOnCooldown = lib.callback.await('jffm:client:isDrugOnCooldown', src, drug)
                        if isDrugOnCooldown then
                            ShowNotification(src, _U('NOTIFICATION__DRUG__COOLDOWN'), "info")
                            return
                        end

                        local metadata = getMetadata(data)
                        if RemoveItem(src, drug, 1, metadata) then
                            TriggerClientEvent('jffm:client:takeDrug', src, drug)
                        else
                            if Config.Debug then lib.print.error('Failed to remove item') end
                        end
                    else
                        ShowNotification(src, _U('NOTIFICATION__DRUG__ALREADY'), "info")
                    end
                end
            end)
        end
    end
end