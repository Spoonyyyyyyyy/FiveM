RegisterCommand('cyberbar', function (rawCommand, args)
    local subCommand = args[1]
    print(subCommand)
    if subCommand == enablegames then 
        TriggerClientEvent('cyberbar:enable_games', -1)
        seatsActive = true
    end
end)