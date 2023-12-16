RegisterNetEvent('sv_spawnMule')
AddEventHandler('sv_spawnMule', function(playerDistance)
    local spawnerPos = vector3(-411.2087, 1176.665, 325.6418)
    local markerPos = vector3(-412.9095, 1169.404, 325.8542)
    local playerPed = GetPlayerPed(source)
    local playerName = GetPlayerName(source)
    local identifier = GetPlayerIdentifierByType(source, 'license')
    local playerId = source
    if playerDistance >1 then
        return
    end
    print(playerName .. ' spawned a mule!')
    local spawnedMule = CreateVehicle(GetHashKey('mule3'), spawnerPos.x, spawnerPos.y, spawnerPos.z, 250.00, true, false)
    TaskWarpPedIntoVehicle(playerPed, spawnedMule, -1)
    Citizen.Wait(300)
    local vehicleType = GetVehicleType(GetVehiclePedIsIn(playerPed, false))
    print(vehicleType)
    if vehicleType ~= 'automobile' then 
        print(player .. " Is not in the correct vehicle!")
        return
    end
    MySQL.scalar("SELECT counter FROM trucking WHERE identifier = ?", {
        identifier
    }, function(counter)
        if not counter then
            local startCount = 1
            MySQL.insert("INSERT INTO trucking (identifier, counter) VALUES (?, ?)", {
                identifier,
                startCount,
            })
        else
            local currentCounter = counter + 1
            MySQL.update("UPDATE trucking SET counter = ? WHERE identifier = ?", {
                currentCounter,
                identifier,
            })
        end
    end)
    TriggerClientEvent('cl_truckingPosition', playerId)
end)

RegisterNetEvent('sv_truckingStart')
AddEventHandler('sv_truckingStart', function ()
    local trucking = true
    local playerId = source
    TriggerClientEvent('cl_drawMarkers', playerId, trucking)
end)

