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

QBCore.Functions.CreateUseableItem("quick_guide", function(source, item)
    TriggerClientEvent("jffmbox:clientUseQuickGuide", source)
end)

QBCore.Functions.CreateUseableItem("tramadol_box", function(source, item)
    TriggerClientEvent("jffmbox:clientunbox", source)
end)

QBCore.Functions.CreateUseableItem("tramadol_karta", function(source, item)
    TriggerClientEvent("jffmbox:clientopeningkarta", source)
end)

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
    
    for _, item in pairs(Config.RewardItems) do
        Player.Functions.AddItem(item.name, item.count)
    end
    
    NotifyPlayer(source, "Tramadol box öppnad", "Du har fått kartor.", "success", "pills")
end)

-- KARTA
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
    
    NotifyPlayer(source, "Tramadol karta öppnad", "Du har fått piller.", "success", "map")
end)