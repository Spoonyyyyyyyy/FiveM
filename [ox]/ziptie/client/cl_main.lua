ziptieMenu = {
    label = 'Ziptie',
    name = 'ziptie',
    canInteract = function (entity)
        local tPlayerIndex = NetworkGetEntityOwner(entity)
        local tPlayer = GetPlayerServerId(tPlayerIndex)
        local xPlayerCoords = GetEntityCoords(PlayerPedId())
        local tPlayerCoords = GetEntityCoords(entity)
        if not Player(tPlayer).state.ziptieStatus and IsEntityPlayingAnim(entity, "random@arrests@busted", "idle_a", 3) and GetDistanceBetweenCoords(xPlayerCoords.x, xPlayerCoords.y, xPlayerCoords.z, tPlayerCoords.x, tPlayerCoords.y, tPlayerCoords.z, false) <1 then
            return true
        end
    end,
    items = 'ziptie',
    onSelect = function (data)
        for key, value in pairs(data) do
            print(key, value)
        end
        local entity = data.entity
        local tPlayerIndex = NetworkGetEntityOwner(entity)
        local tPlayer = GetPlayerServerId(tPlayerIndex)
        print(tPlayer)
        if Player(tPlayer).state.ziptieStatus ~= true then
            TriggerServerEvent('sv_ziptie:send', data, tPlayer, inAnimation)
            FreezeEntityPosition(PlayerPedId(), true)
            loadAnimDict('mp_arresting')
            TaskPlayAnim(GetPlayerPed(PlayerId()), "mp_arresting", "a_uncuff", 8.0, -8, 5.0, 49, 0, 0, 0, 0)
            Citizen.Wait(5500)
            ClearPedSecondaryTask(PlayerPedId())
            FreezeEntityPosition(PlayerPedId(), false)
            exports.ox_inventory:RemoveItem(tostring(PlayerId()), 'ziptie', 1)
        end
    end
}

searchMenu = {
    label = 'Search',
    name = 'search',
    canInteract = function (entity)
        local tPlayer = GetPlayerServerId(NetworkGetEntityOwner(entity))
        local tPlayerStatus = Player(tPlayer).state.ziptieStatus
        local xPlayerCoords = GetEntityCoords(PlayerPedId())
        local tPlayerCoords = GetEntityCoords(entity)
        if tPlayerStatus == true and GetDistanceBetweenCoords(xPlayerCoords.x, xPlayerCoords.y, xPlayerCoords.z, tPlayerCoords.x, tPlayerCoords.y, tPlayerCoords.z, false) <1 then
            return true
        end
    end,
    onSelect = function (data)
        exports.ox_inventory:openInventory('player', GetPlayerServerId(NetworkGetEntityOwner(data.entity)))
    end
}

unziptieMenu = {
    label = 'Remove Zipties',
    name = 'unziptie',
    canInteract = function (entity)
        local tPlayer = GetPlayerServerId(NetworkGetEntityOwner(entity))
        local tPlayerStatus = Player(tPlayer).state.ziptieStatus
        local xPlayerCoords = GetEntityCoords(PlayerPedId())
        local tPlayerCoords = GetEntityCoords(entity)
        if tPlayerStatus == true and GetDistanceBetweenCoords(xPlayerCoords.x, xPlayerCoords.y, xPlayerCoords.z, tPlayerCoords.x, tPlayerCoords.y, tPlayerCoords.z, false) <1 then
            return true
        end
    end,
    onSelect = function (data)
        local tPlayerIndex = NetworkGetEntityOwner(data.entity)
        local tPlayer = GetPlayerServerId(tPlayerIndex)
        TriggerServerEvent('sv_ziptie:unziptie',data, tPlayer)
        FreezeEntityPosition(PlayerPedId(), true)
        loadAnimDict('mp_arresting')
        TaskPlayAnim(GetPlayerPed(PlayerId()), "mp_arresting", "a_uncuff", 8.0, -8, 5.0, 49, 0, 0, 0, 0)
        Citizen.Wait(5500)
        ClearPedSecondaryTask(PlayerPedId())
        FreezeEntityPosition(PlayerPedId(), false)
    end
}

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterCommand('k', function()
    TriggerEvent('kneesAnim')
end)

RegisterNetEvent('kneesAnim')
AddEventHandler('kneesAnim', function()

    local player = GetPlayerPed(PlayerId())
    local playerStatus = Player(GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))).state.ziptieStatus

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
        if not inAnimation and playerStatus ~= true then
            inAnimation = true
            loadAnimDict( "random@arrests" )
	        loadAnimDict( "random@arrests@busted" )
	        TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
	        Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
	        Wait (500)
	        TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
	        Wait (1000)
	        TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
            while inAnimation  and not playerStatus do
                Citizen.Wait(1)
                if IsControlJustReleased(0, 73) then 
                    TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
		            Wait (3000)
                    TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
                    inAnimation = false
                end
            end
        end
    end
end)

CreateThread(function ()
    exports.ox_target:addGlobalPlayer(ziptieMenu)
    exports.ox_target:addGlobalPlayer(unziptieMenu)
    exports.ox_target:addGlobalPlayer(searchMenu)
end)


RegisterNetEvent('cl_ziptie:ziptie', function ()
    local playerPed = PlayerPedId()
    if Player(GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))).state.ziptieStatus == false then
        Citizen.Wait(5600)
        print('ziptied')
        loadAnimDict('mp_arresting')
        loadAnimDict('random@arrests')
        TaskPlayAnim(playerPed, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 8.0, -1, 49, 0, 0, 0, 0)
        SetEnableHandcuffs(playerPed, true)
        DisablePlayerFiring(playerPed, true)
        SetPedCanPlayGestureAnims(playerPed, false)
        lib.notify({
            title = 'Ziptie',
            description = 'You have been ziptied!',
            type = 'info'
        })
        TriggerServerEvent('sv_ziptie:setStatus')
    end
end)

RegisterNetEvent('cl_ziptie:unziptie', function ()
    local playerPed = PlayerPedId()
    if Player(GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))).state.ziptieStatus == true then
        Citizen.Wait(5600)
        ClearPedSecondaryTask(playerPed)
	    SetEnableHandcuffs(playerPed, false)
	    DisablePlayerFiring(playerPed, false)
        FreezeEntityPosition(playerPed, false)
	    SetPedCanPlayGestureAnims(playerPed, true)
        inAnimation = false
    end
end)