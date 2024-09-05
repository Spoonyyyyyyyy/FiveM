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

local function loadIPL(gamemode)
    local Configeration = Config.arenaOptions
    if gamemode == "GunGame" then 
        local sceneIndex = 3
        local scene = Configeration[sceneIndex].scene[1]
        local props = Configeration[sceneIndex].props[math.random(9)]
        print("Scene Index: " , sceneIndex, "Scene: " , scene, "Props: ", props)
    elseif gamemode == "Normal" then
        local sceneIndex = math.random(3)
        local scene = Configeration[sceneIndex].scene
        local props = Configeration[sceneIndex].props[math.random(9)]
        print("Scene Index: " , sceneIndex, "Scene: " , scene, "Props: ", props)
    end
end


local function enableGames(source)
    if Config.seatsActive then 
        print(GetPlayerName(source) .. " attempted to enable games whilist seats are acitve.")
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Cyberbar',
            duration = 10000,
            description = "Games have already been enabled.",
            type = 'error'
        })
        return
        elseif not Config.gamemode then
            print(GetPlayerName(source) .. " attempted to enablegame without a gamemode selected.")
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Cyberbar',
                duration = 10000,
                description = 'No gamemode selected.',
                type = 'error'
            })
        return
    end
    if Config.gamemode == "Normal" or "gunGame" then 
        loadIPL(Config.gamemode)
    end
    local drawSeats = true
    TriggerClientEvent('cl_cyberbar:enableGames', -1, drawSeats)
    Config.seatsActive = true
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
            return TriggerClientEvent('ox_lib:notify', source, {
                title = 'Cyberbar',
                duration = 5000,
                description = string.format('Gamemode has been set to %s', Config.gamemode),
                type  = 'success'
            })
        else
            return TriggerClientEvent('ox_lib:notify', source, {
                title = 'Cyberbar',
                duration = 5000,
                description = string.format('Gamemode is already set to %s', gameFunction),
                type = 'error'
            })
        end
        
    end
end)

local function cyberbarSeatSync(source, playerTeam, seatIndex)
    Config.seatMarkers[seatIndex].status = true
    print(playerTeam)
    TriggerClientEvent('cl_cyberbar:seatSync', -1, Config.seatMarkers)
    print(Config.seatMarkers[seatIndex].status)
    if playerTeam == 'Alpha' then
        table.insert(Config.teams.Alpha.playerSource, source)
    elseif playerTeam == 'Beta' then 
        table.insert(Config.teams.Beta.playerSource, source)
    end
end

RegisterNetEvent('sv_cyberbar:joinGame', function (playerTeam, seatIndex)
    local playerSource = source
    if table.contains(Config.teams.Alpha.playerSource, source) or table.contains(Config.teams.Beta.playerSource) or not Config.seatsActive or Config.seatMarkers[seatIndex].status == true then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Cyberbar',
            duration = 10000,
            description = "This seat is not available!",
            type = 'error'
        })
        return
    end
    Config.seatMarkers[seatIndex].playerId = source
    cyberbarSeatSync(playerSource, playerTeam, seatIndex)
end)

RegisterCommand('tableValues', function ()
    for _, v in ipairs(Config.seatMarkers) do 
        local seatIndex = tostring(v.seatIndex)
        local team = tostring(v.team)
        local status = tostring(v.status)
        local coords = tostring(v.coords)
        local playerId = tostring(v.playerId)
        print(seatIndex, team, status, coords, playerId)
    end
    for _, c in ipairs(Config.teams.Alpha.playerSource) do 
        print("Alpha: ", c)
    end
    for _, b in ipairs(Config.teams.Beta.playerSource) do 
        print("Beta: ", b)
    end
end)

RegisterCommand('test', function ()
    for k, v in pairs(Config.arenaOptions) do
        print(k, v)
    end
    print(Config.arenaOptions.dystopian.props[3])
end)