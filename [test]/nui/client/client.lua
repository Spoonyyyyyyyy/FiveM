CreateThread(function()
    while true do 
        Wait(10)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerHeading = GetEntityHeading(playerPed)
        SendNUIMessage({
            type = 'position',
            x = playerCoords.x,
            y = playerCoords.y, 
            z = playerCoords.z,
            heading = playerHeading,
        })
    end
end)

CreateThread(function()
    while true do 
       Wait(60000)
       
       SendNUIMessage({
        type = 'ping',
       })
    end
end)

RegisterNUICallback('pong', function(data, cb)
    print('Got pong, foo value is,', data.foo)

    cb({
        acceptedPong = true,
    })
end)

RegisterCommand('+openteleporter', function()
    SetNuiFocus(true, true)
end)

RegisterKeyMapping('+openteleporter', 'Open Teleporter', 'keyboard', 'F5')

RegisterNUICallback('releaseFocus', function(data, cb)
    cb({})

    SetNuiFocus(false, false)
end)

RegisterNUICallback('teleport', function(data, cb)
    cb({})
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, tonumber(data.x), tonumber(data.y), tonumber(data.z))
    SetNuiFocus(false, false)
end)