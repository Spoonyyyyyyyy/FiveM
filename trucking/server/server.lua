
RegisterNetEvent('sv_trucking:spawnMule', function (isPedInVehicle)
    local xPlayer = source
    print(xPlayer)
    if isPedInVehicle ~= 0 or GetVehiclePedIsIn(GetPlayerPed(xPlayer), false) ~= 0 then
        return
    end
    local randNum = math.random(1, 4)
    local playerPed = GetPlayerPed(xPlayer)
    print(playerPed)
    Citizen.Wait(200)
    local spawnedVehicle = CreateVehicle(GetHashKey(Config.allowedVehicle[randNum]), Config.truckLocations.pulloutLocation.x, Config.truckLocations.pulloutLocation.y, Config.truckLocations.pulloutLocation.z, 197.82455444335935, true, false)
    Wait(200)
    TaskWarpPedIntoVehicle(playerPed, spawnedVehicle, -1)
end)

RegisterNetEvent('sv_trucking:selectLocations', function (currentVehicle)
    local xPlayer = source
    print(currentVehicle)
    if currentVehicle ~= 'MULE' and GetVehiclePedIsIn(GetPlayerPed(xPlayer), false) == 0 then 
        print(GetPlayerName(xPlayer), "Attempted to start a mission without the required vehicle")
        return
    end
    print("Success")
    
end)