function checkHost(source)
    local playerLicense = GetPlayerIdentifierByType(source, 'license')
    if table.contains(Config.hosts, playerLicense) then
        return true
    else
        return false
    end
end

RegisterNetEvent('sv_cyberbar:command', function (command)
    print(checkHost(source))
    if not checkHost(source) then 
        return TriggerClientEvent('ox_lib:notify', source, {
            title = 'Cyberbar',
            duration = 10000,
            description = "You do not have permission to do this command!",
            type = 'error'
        })
    end
    print('y')
end)
