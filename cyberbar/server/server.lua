arenaPos = vector3(2800.123, -3698.778, 140.001)
arenaOptions = {
    dystopian = {
        scene = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_Scene")'
        },
         props = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_01")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_02")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_03")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_04")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_05")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_06")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_07")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_08")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_09")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_10")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_11")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_12")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_13")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_14")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_15")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Dystopian_17")',
        },
    },
        scifi = {
        scene = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_Scene")'
        },
        props = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_01")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_02")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_03")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_04")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_05")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_06")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_07")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_08")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_09")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Scifi_10")',
        }
    },
    wasteland = {
        scene = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_Scene")'
        },
        props = {
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_01")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_02")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_03")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_04")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_05")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_06")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_07")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_08")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_09")',
            'EnableInteriorProp(GetInteriorAtCoords(2800.000, -3800.000, 100.000), "Set_Wasteland_10")'
        }
    }
}

weaponOptions = {
    'weapon_pistol_mk2',
    'weapon_appistol',
    'weapon_pistol50',
    'weapon_microsmg',
    'weapon_smg',
    'weapon_smg_mk2',
    'weapon_assaultsmg',
    'weapon_machinepistol',
    'weapon_minismg',
    'weapon_assaultrifle',
    'weapon_assaultrifle_mk2',
    'weapon_carbinerifle',
    'weapon_carbinerifle_mk2',
    'weapon_advancedrifle',
    'weapon_specialcarbine',
    'weapon_specialcarbine_mk2',
    'weapon_bullpuprifle',
    'weapon_bullpuprifle_mk2',
    'weapon_compactrifle',
    'weapon_mg',
    'weapon_combatmg',
    'weapon_combatmg_mk2',
}


CreateThread(function ()
    CreateThread(drawBlip)
end)

function drawBlip()
    RemoveBlip(cyberbarBlip)
    local cyberbarBlip = AddBlipForCoord(309.4091, -907.0831, 29.29298)
    SetBlipSprite(cyberbarBlip, 484)
    alphaTeam = {
        playerId = {},
        playersKilled = {}
    }
    betaTeam = {
        playerId = {},
        playersKilled = {}
    }
    print('#################################')
end

RegisterCommand('cyberbar', function(rawCommand, args)
    local subCommand = args[1]
    if subCommand == 'start' then
        if not currentGame then 
            TriggerClientEvent('cyberbar:gameMarkers', -1)
            CreateThread(selectArena)
            currentGame = true
        end
    end
    if subCommand == 'startGame' then
        TriggerEvent('cyberbar:startGame')
    end
    if subCommand == 'teams' then 
        for k, v in ipairs(alphaTeam.playerId) do
            print(GetPlayerName(v))
        end
        print(#alphaTeam.playerId)
        print(#betaTeam.playerId)
    end
    if subCommand == 'end' then
        local searchString = 'Enable'
        local replacementString = 'Disable'
        local unloadArena = string.gsub(tostring(selectedArena), searchString, replacementString)
        local unloadProps = string.gsub(tostring(selectedProps), searchString, replacementString)
        TriggerClientEvent('cyberbar:unloadIpl', -1, unloadArena, unloadProps)
        TriggerClientEvent('cyberbar:endGame', -1)
        for k, v in ipairs(alphaTeam) do
            SetEntityCoords(GetPlayerPed(v), 335.6321, -904.3586, 29.25145, true, false, false, false)
        end
        for k, v in ipairs(betaTeam) do
            SetEntityCoords(GetPlayerPed(v), 335.6321, -904.3586, 29.25145, true, false, false, false)
        end
        alphaTeam = wipeAlphaTeam()
        betaTeam = wipeBetaTeam()
        currentGame = false
    end
end)


RegisterNetEvent('cyberbar:joinSeat', function (markerInfo, seatIndex)
    if markerInfo.status == false or nil then
    return
    end
    local playerSrc = source
    SetEntityCoords(GetPlayerPed(source), arenaPos.x, arenaPos.y, arenaPos.z, true, false, false, false)

    if seatIndex <= 5 then
        table.insert(alphaTeam.playerId, playerSrc)
    end
    if seatIndex > 5 then 
        table.insert(betaTeam.playerId, playerSrc)
    end

    TriggerClientEvent('cyberbar:sync', -1, seatIndex )
end)

AddEventHandler('cyberbar:startGame', function ()
    local weaponRand = math.random(1, #weaponOptions)
    local selectedWeapon = weaponOptions[weaponRand]
    for _, v in pairs(alphaTeam.playerId) do
        SetCurrentPedWeapon(GetPlayerPed(v), selectedWeapon, true)
    end
    for _, v in pairs(betaTeam.playerId) do
        SetCurrentPedWeapon(GetPlayerPed(v), selectedWeapon, true)
    end
end)

AddEventHandler('baseevents:onPlayerDied', function ()
    local playerDied = source
    if playerDied ~= alphaTeam.playerId or betaTeam.playerId and currentGame ~= true then
        return
    end
end)

function selectArena()
    local arenaKeys = {}
    local propsKeys = {}

    for key, _ in pairs(arenaOptions) do
        table.insert(arenaKeys, key)
    end

    local arenaRand = math.random(1, #arenaKeys) 
    local selectedArenaKey = arenaKeys[arenaRand]
    selectedArena = arenaOptions[selectedArenaKey].scene[1]
    print('Map Selected: ', selectedArena)

    for _, prop in ipairs(arenaOptions[selectedArenaKey].props) do
        table.insert(propsKeys, prop)
    end

    local propRand = math.random(1, #propsKeys)
    selectedProps = propsKeys[propRand]
    print('Props Selected: ', selectedProps)

    TriggerClientEvent('cyberbar:loadIpl', -1, selectedArena, selectedProps)
end

function wipeAlphaTeam()
    local alphaBlank = {
        playerId = {},
        playersKilled = {}
    }
    return alphaBlank
end

function wipeBetaTeam()
    local betaBlank = {
        playerId = {},
        playersKiled = {}
    }
    return betaBlank
end