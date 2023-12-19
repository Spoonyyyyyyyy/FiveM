
RegisterNetEvent('sv_ziptie:send', function (data, tPlayer)
    if tPlayer == nil or false then
        return
    end

    print('---------')
    for key, value in pairs(data) do
        print(key, value)
    end
    print('---------')
    print(data.entity)
    print('---------')
    local xPlayer = source
    local tPlayer = tPlayer
    local xPlayerCoords = GetEntityCoords(GetPlayerPed(xPlayer))
    local tPlayerCoords = GetEntityCoords(GetPlayerPed(tPlayer))

    local distance = #(xPlayerCoords - tPlayerCoords)

    if distance >1 then 
        print(GetPlayerName(source))
        return 
    end
    print("Player Zipting: " .. GetPlayerName(xPlayer))
    print("Player being Ziptied: " .. GetPlayerName(tPlayer))
    TriggerClientEvent('cl_ziptie:ziptie', tPlayer)
    Citizen.Wait(5600)
    Player(tPlayer).state.set('blindfold', 'blindfoldStatus', false, true)
    Player(tPlayer).state.set('ziptie', 'ziptieStatus', true, true)
end)

RegisterNetEvent('sv_ziptie:unziptie', function (data, tPlayer)
    if tPlayer == nil or false then
        return
    end

    print('---------')
    for key, value in pairs(data) do
        print(key, value)
    end
    print('---------')
    print(data.entity)
    print('---------')
    local xPlayer = source
    local tPlayer = tPlayer
    local xPlayerCoords = GetEntityCoords(GetPlayerPed(xPlayer))
    local tPlayerCoords = GetEntityCoords(GetPlayerPed(tPlayer))

    local distance = #(xPlayerCoords - tPlayerCoords)

    if distance >1 then 
        print(GetPlayerName(source) .. "Attempted to remove: " .. GetPlayerName(tPlayer) .. "ziptie's  but was to far away!")
        return
    end
    Player(tPlayer).state:set('ziptieStatus', false, true)
    TriggerClientEvent('cl_ziptie:unziptie', tPlayer)
end)

RegisterNetEvent('sv_ziptie:setStatus', function ()
    print(source)
    Player(source).state:set('ziptieStatus', true, true)
end)

