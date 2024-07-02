function table.contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end

local function checkHost(source)
    local playerLicense = GetPlayerIdentifierByType(source, 'license')
    if table.contains(Config.hosts, playerLicense) then
        return true
    else
        return false
    end
end

local function enableGames()
    TriggerClientEvent('cl_cyberbar:enablegames', -1)
end

RegisterNetEvent('sv_cyberbar:command', function(command)
    local source = source
    if not checkHost(source) then 
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Cyberbar',
            duration = 10000,
            description = "You do not have permission to do this command!",
            type = 'error'
        })
        return
    end
    
    local subCommand = command[1]
    if subCommand == 'enablegames' then
        enableGames(source)
    elseif subCommand == 'gamemode' and #command == 2 then
        local gameFunction = command[2]
        if Config.gamemode ~= gameFunction then 
            Config.gamemode = gameFunction
        end 
    end
end)

function enableGames(source)
    if Config.seatsActive then 
        print(GetPlayerName(source) .. " attempted to enable games whilist seats are acitve.")
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Cyberbar',
            duration = 10000,
            description = "Games have already been enabled.",
            type = 'error'
        })
        return 
    end
    Config.seatsActive = true
end