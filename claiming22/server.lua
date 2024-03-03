allowedLicense = 'license:0ea3bf0403ac5097276535391d9e40ebc3386d77'
claimingStatus = {
    claimingActive = false, 
    spawnsActive = {
        status = false,
        teamA = nil,
        teamB = nil
    },
    currentClaim = {
        identifier = nil,
        sourceId = nil,
        name = nil
    }
}


RegisterCommand('showTeams', function (source, args, raw)
    print(claimingStatus.spawnsActive.teamA)
    print(claimingStatus.spawnsActive.teamB)
end)

function checkLicense(source)
    local playerLicense = GetPlayerIdentifierByType(source, 'license')
    if playerLicense ~= allowedLicense then 
        return false
    elseif playerLicense == allowedLicense then
        return true
    end
end

function setTeamSpawns()
    if claimingStatus.spawnsActive.status == false and claimingStatus.spawnsActive.teamA == nil then 
        print('a')
        return teamA
    elseif claimingStatus.spawnsActive.status == false and claimingStatus.spawnsActive.teamB == nil then
        print('b')
        return teamB 
    elseif claimingStatus.spawnsActive.status == false and claimingStatus.spawnsActive.teamA ~= nil and claimingStatus.spawnsActive.teamB ~= nil then
        print('c')
        return spawnSet
    end
end

RegisterNetEvent('sv_createClaiming', function (playerCoords)
    if not checkLicense(source) then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", "You don't have permission to execute this command!"}
        })
        return
    end
    if not claimingStatus.spawnsActive.status then 
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true, 
            args = {"System", "You need to place down team spawn locations!"}
        })
        if setTeamSpawns() == teamA then 
            TriggerClientEvent('cl_claimingSpawns', source, true, 'teamA')
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Claiming Spawns',
                description = 'Press G to place down team A spawns',
                type = 'success'
            })
        elseif setTeamSpawns() == teamB then 
            TriggerClientEvent('cl_claimingSpawns', source, true, 'teamB')
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Claiming Spawns',
                description = 'Press G to place down team B spawns',
                type = 'success'
            })
        elseif setTeamSpawns() == spawnSet then
            TriggerEvent('yay')
        end
    end
end)

RegisterNetEvent('sv_setTeamSpawnLocation', function (playerCoords, team)
    if team == 'teamA' then 
        claimingStatus.spawnsActive.teamA = playerCoords
        if setTeamSpawns() == teamB then
            local test = setTeamSpawns()
            print(team, test)
            TriggerClientEvent('cl_claimingSpawns', source, true, 'teamB')
        end
    elseif team == 'teamB' then 
        claimingStatus.spawnsActive.teamB = playerCoords
        if setTeamSpawns() == teamA then
            TriggerClientEvent('cl_claimingSpawns', source, true, 'teamA')
            local test = setTeamSpawns()
            print(team, test)
        end
    elseif setTeamSpawns() == 'spawnSet' then 
        TriggerEvent('test')
    end
end)

AddEventHandler('test', function ()
    print('yay')
end)
