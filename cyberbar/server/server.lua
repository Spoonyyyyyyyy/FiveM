function table.contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end

function checkHost(source)
    local playerLicense = GetPlayerIdentifierByType(source, 'license')
    if table.contains(Config.hosts, playerLicense) then
        return true
    else
        return false
    end
end

function enableGames()
    TriggerClientEvent('cl_cyberbar:enablegames')
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
    if #command == 1 then 
        local subCommand = command[1] 
        if subCommands == enablegames then
            enableGames()
        end
    elseif command[1] == 'gamemode' then
        local gameFunction = command[2]
    end
end)