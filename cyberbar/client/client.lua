function Draw3DText(x, y, z, scl_factor, text, red, green, blue, alpha)
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

seatMarkers = {
    {seat = seatOne, team = 'Alpha', status = false, coords = vector3(325.3435, -904.7751, 29.25145)},
    {seat = seatTwo, team = 'Alpha', status = false, coords = vector3(327.0339, -904.6738, 29.25145)},
    {seat = seatThree, team = 'Alpha',status = false, coords = vector3(328.7007, -904.6966, 29.25145)},
    {seat = seatFour, team = 'Alpha', status = false, coords = vector3(330.4021, -904.6966, 29.25145)},
    {seat = seatFive, team = 'Alpha', status = false, coords = vector3(332.0874, -904.6988, 29.25145)},
    {seat = seatSix, team = 'Beta', status = false, coords = vector3(337.5286, -903.5734, 29.25146)},
    {seat = seatSeven, team = 'Beta', status = false, coords = vector3(339.2241, -903.5478, 29.25146)},
    {seat = seatEight, team = 'Beta', status = false, coords = vector3(340.9525, -903.3763, 29.25146)},
    {seat = seatNine, team = 'Beta', status = false, coords = vector3(342.65, -903.535, 29.25146)},
    {seat = seatTen, team = 'Beta', status = false, coords= vector3(344.2519, -903.4109, 29.25146)}
}

defaultSeatMarkers = {
    {seat = seatOne, team = 'Alpha', status = false, coords = vector3(325.3435, -904.7751, 29.25145)},
    {seat = seatTwo, team = 'Alpha', status = false, coords = vector3(327.0339, -904.6738, 29.25145)},
    {seat = seatThree, team = 'Alpha', status = false, coords = vector3(328.7007, -904.6966, 29.25145)},
    {seat = seatFour, team = 'Alpha', status = false, coords = vector3(330.4021, -904.6966, 29.25145)},
    {seat = seatFive, team = 'Alpha', status = false, coords = vector3(332.0874, -904.6988, 29.25145)},
    {seat = seatSix, team = 'Beta', status = false, coords = vector3(337.5286, -903.5734, 29.25146)},
    {seat = seatSeven, team = 'Beta', status = false, coords = vector3(339.2241, -903.5478, 29.25146)},
    {seat = seatEight, team = 'Beta', status = false, coords = vector3(340.9525, -903.3763, 29.25146)},
    {seat = seatNine, team = 'Beta', status = false, coords = vector3(342.65, -903.535, 29.25146)},
    {seat = seatTen, team = 'Beta', status = false, coords= vector3(344.2519, -903.4109, 29.25146)}
}

CreateThread(function ()
    exports.spawnmanager:setAutoSpawn(false)
end)

RegisterNetEvent('cyberbar:gameMarkers', function ()
    local playerPed = PlayerPedId()
    gameMarker = true
    while gameMarker do 
        Citizen.Wait(1)
        playerCoords = GetEntityCoords(playerPed)
        for i, markerInfo in ipairs(seatMarkers) do
            seat = markerInfo.seat
            team = markerInfo.team
            seatCoords = markerInfo.coords
            status = markerInfo.status
            if not status then
                DrawMarker(25, seatCoords.x, seatCoords.y, seatCoords.z-0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 0, 255, 0, 75, false, false, 2, false, nil, nil, false)
                if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, seatCoords.x, seatCoords.y, seatCoords.z, false) <= 0.60 then
                    Draw3DText(seatCoords.x, seatCoords.y, seatCoords.z, 0.5, ('Join %s Team'):format(team), 255, 255, 255, 255)
                    if IsControlJustPressed(0, 113) then
                        markerInfo.status = true
                        TriggerServerEvent('cyberbar:joinSeat', markerInfo, i)
                    end
                end
             end
        end
    end
end)

RegisterNetEvent('cyberbar:sync', function (seatIndex)
    print(seatIndex)
    if seatIndex == nil or seatMarkers[seatIndex].status == true then
        return
    end
    seatMarkers[seatIndex].status = true
end)

RegisterNetEvent('cyberbar:endGame', function()
    gameMarker = false
    seatMarkers = resetTable()
end)

RegisterNetEvent('cyberbar:loadIpl', function (selectedArena, selectedProps)
    print(selectedArena, type(selectedArena))
    print(selectedProps, type(selectedProps))
    RequestIpl("xs_arena_interior")
    EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_A")
    EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_B")
    EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_C")
    EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_D")
    arenaFunc = load(selectedArena)
    arenaFunc()
    propsFunc = load(selectedProps)
    propsFunc()

    if not arenaErr or propsErr or mainErr then
        print('Arena Loaded Successfully')
    else
        print('Arena Failed to Load ', arenaErr, propsErr)
    end
end)

RegisterNetEvent('cyberbar:unloadIpl', function (unloadedArena, unloadedProps)
    unloadPropsFunc, unloadPropsErr = load(unloadedArena)
    unloadPropsFunc()
    unloadArenaFunc, unloadArenaErr = load(unloadedProps)
    unloadArenaFunc()
    DisableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_A")
    DisableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_B")
    DisableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_C")
    DisableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Crowd_D")
    RemoveIpl("xs_arena_interior")
end)

function resetTable()
    return defaultSeatMarkers
end