

RegisterCommand('car', function (rawCommands, args)
    local requestedVehicle = args[1] or 'adder'
    if not args[1] then 
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"Sytem", "You do not have permissions or requested an invaild vehicle!"}
        })
    end
    TriggerServerEvent('spawnVehicle', requestedVehicle)
end)

RegisterCommand('vehicleMods', function ()
    local currentVehicleMods = {}
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    for k, vehicleMods in ipairs(vehicleMods) do
        local modName = vehicleMods.modName
        local modId = vehicleMods.modId
        local modValue = GetVehicleMod(currentVehicle, modId)
        print(modName, modValue)
        table.insert(currentVehicleMods, tostring(modValue))
    end
    local primaryVehicleColour = GetVehicleCustomPrimaryColour(currentVehicle)
    local secondaryVehicleColour = GetVehicleCustomSecondaryColour(currentVehicle)
    print(primaryVehicleColour, secondaryVehicleColour)
    print('----------------------')
    for a, b in pairs(currentVehicleMods) do 
        print(a, b) 
    end
    print(currentVehicle)
end)
    
RegisterCommand('saveVehicle', function ()
    local currentVehicleMods = {}
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    for k, vehicleMods in ipairs(vehicleMods) do
        local modName = vehicleMods.modName
        local modId = vehicleMods.modId
        local modValue = GetVehicleMod(currentVehicle, modId)
        print(modName, modValue)
        table.insert(currentVehicleMods, tostring(modValue))
    end
    local primaryVehicleColour = GetVehicleCustomPrimaryColour(currentVehicle)
    local secondaryVehicleColour = GetVehicleCustomSecondaryColour(currentVehicle)
    print(currentVehicle)
    print(primaryVehicleColour, secondaryVehicleColour)
end)


RegisterKeyMapping('lockVehicle', "Toggle Vehicle Lock", "KEYBOARD", "L")

RegisterCommand("lockVehicle", function ()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local closestVehicleEntity, closestVehicleCoords = lib.getClosestVehicle(playerCoords, 5.0, true)
    print(closestVehicleEntity, closestVehicleCoords)
    TriggerServerEvent('sv_lockVehicle', closestVehicleEntity, closestVehicleCoords)
end)