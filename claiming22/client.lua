RegisterCommand('createClaiming', function ()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    TriggerServerEvent('sv_createClaiming', playerCoords)
end)

RegisterNetEvent('cl_clamingSpawns', function (setClaimingSpawns, team)
    while setClaimingSpawns do 
        Citizen.Wait(1)
        if IsControlJustPressed(2, 47) then 
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            print(playerCoords)
        end
    end
end)