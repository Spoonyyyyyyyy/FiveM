RegisterCommand('createClaiming', function ()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    TriggerServerEvent('sv_createClaiming', playerCoords)
end)

RegisterNetEvent('cl_claimingSpawns', function (setClaimingSpawns, team)
    print(team)
    while setClaimingSpawns do
        Citizen.Wait(1)
        if IsControlJustReleased(2, 47) then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            setClaimingSpawns = false
            TriggerServerEvent('sv_setTeamSpawnLocation', playerCoords, team)
            print(setClaimingSpawns)
        end
    end
end)