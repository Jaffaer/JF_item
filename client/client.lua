-- Tram låda
RegisterNetEvent("jffmbox:clientunbox", function()
    local playerPed = PlayerPedId()
    
    lib.progressCircle({
        duration = 8000,
        label = "Öppnar upp Tram lådan...",
        position = "bottom",
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = false,
            combat = true
        },
        anim = {
            dict = "drog@box_anim",
            clip = "drogbox_clip"
        },
        prop = {
            model = 147380063,
            bone = 18905,
            pos = vec3(0.11808711792798, 0.017931041793501, 0.03),
            rot = vec3(80.030449625474, 185.2392588244244, -190.564130199962)
        }
    })
    
    TriggerServerEvent("jffmbox:serverGiveItems")
end)
-- KARTA
RegisterNetEvent("jffmbox:clientopeningkarta", function()
    local playerPed = PlayerPedId()
    
    lib.progressCircle({
        duration = 6000,
        label = "Öppnar Kartan...",
        position = "bottom",
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = false,
            combat = true
        },
        anim = {
            dict = "drog@karta_anim",
            clip = "drogkarta_clip"
        },
        prop = {
            model = -1132076653,
            bone = 18905,
            pos = vec3(0.11808711792798, 0.017931041793501, 0.027564815385367),
            rot = vec3(90.030449625474, -2.2392588244244, -14.564130199962)
        }
    })
    
    TriggerServerEvent("jffmbox:serverGiveItemskarta")
end)

-- Lyrica 
RegisterNetEvent("jffmbox:clientlyricaunbox", function()
    local playerPed = PlayerPedId()
    
    lib.progressCircle({
        duration = 8000,
        label = "Öppnar upp Lyrica lådan...",
        position = "bottom",
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = false,
            combat = true
        },
        anim = {
            dict = "drog@box_anim",
            clip = "drogbox_clip"
        },
        prop = {
            model = -575817142,
            bone = 18905,
            pos = vec3(0.11808711792798, 0.017931041793501, 0.03),
            rot = vec3(80.030449625474, 185.2392588244244, -190.564130199962)
        }
    })
    
    TriggerServerEvent("jffmbox:serverGiveItemslyrica")
end)
-- Lyrica KARTA
RegisterNetEvent("jffmbox:clientopeninglyricakarta", function()
    local playerPed = PlayerPedId()
    
    lib.progressCircle({
        duration = 6000,
        label = "Öppnar Kartan...",
        position = "bottom",
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = false,
            combat = true
        },
        anim = {
            dict = "drog@karta_anim",
            clip = "drogkarta_clip"
        },
        prop = {
            model = -1132076653,
            bone = 18905,
            pos = vec3(0.11808711792798, 0.017931041793501, 0.027564815385367),
            rot = vec3(90.030449625474, -2.2392588244244, -14.564130199962)
        }
    })
    
    TriggerServerEvent("jffmbox:serverGiveItemskartalyrica")
end)

-- LSD
RegisterNetEvent("jffmbox:clientunboxlsd", function()
    local playerPed = PlayerPedId()
    
    lib.progressCircle({
        duration = 8000,
        label = "River av LSD lappar...",
        position = "bottom",
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = false,
            combat = true
        },
        anim = {
            dict = "drog@box_anim",
            clip = "drogbox_clip"
        },
        prop = {
            model = -1863081587,
            bone = 18905,
            pos = vec3(0.11808711792798, 0.017931041793501, 0.027564815385367),
            rot = vec3(180.030449625474, -2.2392588244244, -180.564130199962)
        }
    })
    
    TriggerServerEvent("jffmbox:serverGivelsdItems")
end)