

RegisterCommand('car', function (rawCommands, args)
    local requestedVehicle = args[1] or adder
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
    print(getVehicleMods())
end)
    
RegisterCommand('saveVehicle', function ()
    
end)

function getVehicleMods()
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local currentVehicleMods = {
        suspension = {},
        armour = {},
        transmission = {},
        turbo = {},
        lights = {},
        engine = {},
        brakes = {}
    }
    for k, vehicleMods in ipairs(vehicleMods) do
        local modName = vehicleMods.modName
        local modId = vehicleMods.modId
        local modValue = GetVehicleMod(currentVehicle, modId)
        print(modName, modValue)
        table.insert(currentVehicleMods.modName, modValue)
    end
    local primaryVehicleColour = GetVehicleCustomPrimaryColour(currentVehicle)
    local secondaryVehicleColour = GetVehicleCustomSecondaryColour(currentVehicle)
    print(primaryVehicleColour, secondaryVehicleColour)
    return currentVehicleMods
end

