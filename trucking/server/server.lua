
RegisterNetEvent('sv_trucking:spawnMule', function (isPedInVehicle)
    print(source)
    if isPedInVehicle ~= 0 or GetVehiclePedIsIn(GetPlayerPed(source), false) ~= 0 then
        return
    end
    local randNum = math.random(1, 4)
    playerPed = GetPlayerPed(source)
    print(playerPed)
    Citizen.Wait(200)
    local spawnedVehicle = CreateVehicle(GetHashKey(Config.allowedVehicle[randNum]), Config.truckLocations.pulloutLocation.x, Config.truckLocations.pulloutLocation.y, Config.truckLocations.pulloutLocation.z, 197.82455444335935, true, false)
    Wait(200)
    TaskWarpPedIntoVehicle(playerPed, spawnedVehicle, -1)
end)

RegisterNetEvent('sv_trucking:selectLocations', function (currentVehicle)
    if currentVehicle ~= 'MULE' and GetVehiclePedIsIn(GetPlayerPed(source), false) == 0 then 
        return 
    end
    
end)