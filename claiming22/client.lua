claimingStatus = Config.claimingStatus 
RegisterCommand('claiming', function (rawCommand, args)
    local round = args[1]
    if not round then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            args = {"CLAIMING", "Please select a round!"}
        })
    end
    TriggerServerEvent('sv_claiming:startRound', round)
end)

RegisterNetEvent('cl_loadClaiming', function (claimingRound, sv_claimingStatus)
    claimingStatus = sv_claimingStatus
    print(claimingStatus)
end)

RegisterCommand('test', function ()
    
end)