local QBCore = exports["qb-core"]:GetCoreObject()

function NotifyPlayer(source, title, description, notifType, icon)
    TriggerClientEvent("ox_lib:notify", source, {
        title = title,
        description = description,
        type = notifType,
        icon = icon,
        position = "center-right",
        duration = 4000,
        style = {
            backgroundColor = notifType == "error" and "#1f1111" or "#11191f",
            color = notifType == "error" and "#FFCCCC" or "#D0F6EF",
            borderRadius = "10px",
            fontSize = "14px"
        }
    })
end
-- LSD
QBCore.Functions.CreateUseableItem("lsd_papper", function(source, item)
    TriggerClientEvent("jffmbox:clientunboxlsd", source)
end)
-- TRAMADOL
QBCore.Functions.CreateUseableItem("tramadol_box", function(source, item)
    TriggerClientEvent("jffmbox:clientunbox", source)
end)

QBCore.Functions.CreateUseableItem("tramadol_karta", function(source, item)
    TriggerClientEvent("jffmbox:clientopeningkarta", source)
end)
-- LYRICA 
QBCore.Functions.CreateUseableItem("lyrica_box", function(source, item)
    TriggerClientEvent("jffmbox:clientlyricaunbox", source)
end)

QBCore.Functions.CreateUseableItem("lyrica_karta", function(source, item)
    TriggerClientEvent("jffmbox:clientopeninglyricakarta", source)
end)

-- LSD
RegisterServerEvent("jffmbox:serverGivelsdItems", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    
    if not Player then return end
    
    local item = Player.Functions.GetItemByName("lsd_papper")
    if not item or item.amount < 1 then
        NotifyPlayer(source, "Unboxing misslyckades", "Du har ingen LSD papper att riva.", "error", "circle-xmark")
        return
    end
    
    Player.Functions.RemoveItem("lsd_papper", 1)
    
    for _, item in pairs(Config.lsditems) do
        Player.Functions.AddItem(item.name, item.count)
    end
    
    NotifyPlayer(source, "Rivit av LSD lappar", "du har fått LSD lappar...", "success", "pills")
end)

--------------------------

-- lyrica Box
RegisterServerEvent("jffmbox:serverGiveItemslyrica", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    
    if not Player then return end
    
    local item = Player.Functions.GetItemByName("lyrica_box")
    if not item or item.amount < 1 then
        NotifyPlayer(source, "Unboxing misslyckades", "Du har ingen Lyrica låda att öppna.", "error", "circle-xmark")
        return
    end
    
    Player.Functions.RemoveItem("lyrica_box", 1)
    
    for _, item in pairs(Config.lyricaboxitems) do
        Player.Functions.AddItem(item.name, item.count)
    end
    
    NotifyPlayer(source, "Lyrica box öppnad", "Du har fått kartor.", "success", "pills")
end)

-- lyrica KARTA
RegisterServerEvent("jffmbox:serverGiveItemskartalyrica", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    
    if not Player then return end

    local drugitem = Player.Functions.GetItemByName("lyrica_karta")
    if not drugitem or drugitem.amount < 1 then
        NotifyPlayer(source, "Unboxing misslyckades", "Du har ingen Lyrica karta att öppna.", "error", "circle-xmark")
        return
    end

    Player.Functions.RemoveItem("lyrica_karta", 1)

    for _, item in pairs(Config.kartalyricaitems) do
        Player.Functions.AddItem(item.name, item.count)
    end
    
    NotifyPlayer(source, "Lyrica karta öppnad", "Du har fått Kapslar.", "success", "map")
end)

--------------------------

-- Tram Box
RegisterServerEvent("jffmbox:serverGiveItems", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    
    if not Player then return end
    
    local item = Player.Functions.GetItemByName("tramadol_box")
    if not item or item.amount < 1 then
        NotifyPlayer(source, "Unboxing misslyckades", "Du har ingen Tramadol låda att öppna.", "error", "circle-xmark")
        return
    end
    
    Player.Functions.RemoveItem("tramadol_box", 1)
    
    for _, item in pairs(Config.tramboxitems) do
        Player.Functions.AddItem(item.name, item.count)
    end
    
    NotifyPlayer(source, "Tramadol box öppnad", "Du har fått kartor.", "success", "pills")
end)

-- tram KARTA
RegisterServerEvent("jffmbox:serverGiveItemskarta", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    
    if not Player then return end

    local drugitem = Player.Functions.GetItemByName("tramadol_karta")
    if not drugitem or drugitem.amount < 1 then
        NotifyPlayer(source, "Unboxing misslyckades", "Du har ingen Tramadol karta att öppna.", "error", "circle-xmark")
        return
    end

    Player.Functions.RemoveItem("tramadol_karta", 1)

    for _, item in pairs(Config.kartaitems) do
        Player.Functions.AddItem(item.name, item.count)
    end
    
    NotifyPlayer(source, "Tramadol karta öppnad", "Du har fått Kapslar.", "success", "map")
end)