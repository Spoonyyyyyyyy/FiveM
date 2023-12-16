RegisterNetEvent('teleporter:goto')
AddEventHandler('teleporter:goto', function (tPlayer)
    local xPlayer = source
    local tPlayerPed = GetPlayerPed(tPlayer)
    local tPlayerCoords = GetEntityCoords(tPlayerPed)
    local tPlayerName = GetPlayerName(tPlayer)
    if not tPlayerName then
        return
    end
    SetEntityCoords(xPlayer, tPlayerCoords.x, tPlayerCoords.y, tPlayerCoords.z, true, false, false, false)
    TriggerClientEvent('chat:addMessage', source, {
        color = {255, 0, 0},
        multiline = false,
        args = {'SYSTEM', 'You teleported to ' .. tPlayerName}
    })
    TriggerClientEvent('chat:addMessage', tPlayer, {
        color = {255, 0, 0},
        multiline = false,
        args = {'SYSTEM', GetPlayerName(xPlayer) .. ' teleported to you!'}
    })
end)

RegisterNetEvent('teleporter:bring')
AddEventHandler('teleporter:bring', function (tPlayer)
    local xPlayer = source
    local xPlayerCoords = GetEntityCoords(GetPlayerPed(source))
    local tPlayerPed = GetPlayerPed(tPlayer)
    local tPlayerName = GetPlayerName(tPlayer)
    print(GetPlayerName(xPlayer))

    if not tPlayerName then
        return
    end
    SetEntityCoords(tPlayerPed, xPlayerCoords.x, xPlayerCoords.y, xPlayerCoords.z, true, false, false, false)
    TriggerClientEvent('chat:addMessage', source, {
        color = {255, 0, 0},
        multiline = false,
        args = {'SYSTEM', 'You brought ' .. tPlayerName}
    })
    TriggerClientEvent('chat:addMessage', tPlayer, {
        color = {255, 0, 0},
        multiline = false,
        args = {'SYSTEM', 'You were brought by ' .. GetPlayerName(xPlayer)}
    })
end)