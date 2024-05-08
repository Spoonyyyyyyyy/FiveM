seatsActive = false
gameActive = false
gameType = nil

RegisterCommand('cyberbar', function (rawCommand, args)
    TriggerServerEvent('sv_cyberbar:command', args)
end)

RegisterNetEvent('cl_cyberbar:enablegames', function ()
    
end)