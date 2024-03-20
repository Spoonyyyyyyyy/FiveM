RegisterNetEvent('spawnVehicle', function (requestedVehicle)
    local requestedVehicleHash = GetHashKey(requestedVehicle)
    local spawnCoords = GetEntityCoords(GetPlayerPed(source))
    local spawnedVehicle = CreateVehicle(requestedVehicleHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, GetEntityHeading(GetPlayerPed(source)), true, false)
    SetPedIntoVehicle(GetPlayerPed(source), spawnedVehicle, -1)
end)

RegisterNetEvent('sv_lockVehicle', function (closestVehicleEntity, closestVehicleCoords)
    print(exports.connection:retrivePlayerID(source))
    print(closestVehicleEntity)
    print(closestVehicleCoords)
    if #GetEntityCoords(GetPlayerPed(source)) - #GetEntityCoords(closestVehicle) <3 then
        local vehicleDoorLockStauts = GetVehicleDoorLockStatus(closestVehicle)
        if vehicleDoorLockStauts == 1 then 
            SetVehicleDoorsLocked(closestVehicle, 2)
            TriggerClientEvent('ox_lib:notify', source, {
                title = "Vehicle Locks",
                description = "Vehicle Locked",
                type = "success"
            })
        elseif vehicleDoorLockStauts == 2 then
            SetVehicleDoorsLocked(closestVehicle, 1)
            TriggerClientEvent('ox_lib:notify', source, {
                title = "Vehicle Locks",
                description = "Vehicle Unlocked",
                type = "success"
            })
        end
    end
end)