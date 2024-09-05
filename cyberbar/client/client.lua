local function Draw3DText(x, y, z, scl_factor, text, red, green, blue, alpha)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
      SetTextScale(0.0, scale)
      SetTextFont(0)
      SetTextProportional(1)
      SetTextColour(red, green, blue, alpha)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(2, 0, 0, 0, 150)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x, _y)
    end
end

local function screenFade(duration)
    DoScreenFadeOut(500)
    Wait(duration * 1000)
    DoScreenFadeIn(500)
end

RegisterCommand('cyberbar', function (rawCommand, args)
    TriggerServerEvent('sv_cyberbar:command', args)
end)

RegisterNetEvent('cl_cyberbar:enableGames', function (drawSeats)
    while drawSeats do
        Citizen.Wait(1)
        for i, v in ipairs(Config.seatMarkers) do
            local coords, team, status = v.coords, v.team, v.status
            local playerCoords = GetEntityCoords(GetPlayerPed(-1))
            if not status then
                DrawMarker(27, coords.x, coords.y, coords.z-0.95, 0, 0, 0, 0, 0, 0, 1.3, 1.3, 1.3, 255, 0, 0, 255, false, false, 0, false, nil, nil, false)
                if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, coords.x, coords.y, coords.z, true) < 0.8 then
                    Draw3DText(coords.x, coords.y, coords.z, 0.5, ('[G] - Join %s team'):format(team), 0, 255, 0, 255)
                    if IsControlJustPressed(0, 47) then
                        TriggerServerEvent('sv_cyberbar:joinGame', team, i)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('cl_cyberbar:seatSync', function (newSeatTable)
    Config.seatMarkers = newSeatTable
    for _, v in ipairs(Config.seatMarkers) do 
        local seatIndex = tostring(v.seatIndex)
        local team = tostring(v.team)
        local status = tostring(v.status)
        local coords = tostring(v.coords)
        local playerId = tostring(v.playerId)
        print(seatIndex, team, status, coords, playerId)
    end
end)

RegisterNetEvent('cl_cyberbar:loadIPL', function (scene, props)
    
end)
